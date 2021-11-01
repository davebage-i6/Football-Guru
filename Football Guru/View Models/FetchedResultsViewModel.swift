//
//  FetchedPlayersViewModel.swift
//  Football Guru
//
//  Created by Dave Bage on 28/10/2021.
//

import SwiftUI
import Combine

class FetchedResultsViewModel: ObservableObject {
    // MARK: - Constants
    
    struct Constants {
        static let startingOffset = 0
        static let startingSearches = 0
        static let searchDelay: RunLoop.SchedulerTimeType.Stride = 0.4
        static let searchIncrement = 10
    }
    
    // MARK: - Published properties
    @Published var searchQuery = ""
    @Published var fetchedPlayers = [PlayerViewModel]()
    @Published var fetchedTeams = [TeamViewModel]()
    
    // We use this to track the number of searches performed. When we reach 2, we know both players and teams have
    // finished searching
    @Published var searches = Constants.startingSearches
    @Published var state: SearchState = .newSearch // Used to track the current state of the view model
    
    // MARK: - Properties
    private let webservice = Webservice() // used for networking
    private var playerOffset = Constants.startingOffset
    private var teamOffset = Constants.startingOffset
    private var playersRechecked = false // we use this to ensure we only recheck once per search
    private var teamsRechecked = false
    
    // Check to see if there are more than 10 players / teams and that there
    // is a multiple of 10 (we don't want to show the more option if there
    // are only 15 results, for example
    var playersExpandable = false
    var teamsExpandable = false
    
    // We use this var to cancel the publisher when we no longer need it
    var cancellables = Set<AnyCancellable>()
    
    // MARK: - Life cycle
    init() {
        setupPublishers()
    }
    
    private func resetOffsets() {
        playerOffset = Constants.startingOffset
        teamOffset = Constants.startingOffset
    }
    
    private func setupPublishers() {
        self.setupSearchQueryPublisher()
        self.setupSearchStatePublisher()
    }
    
    // MARK: - Publishers config
    private func setupSearchQueryPublisher() {
        $searchQuery
            .compactMap {
                $0.replacingOccurrences(of: " ", with: "%") // Remove blank spaces and replace with % for multi word search
            }
            .removeDuplicates() // Remove any duplicate types entries
            .debounce(for: Constants.searchDelay, scheduler: RunLoop.main) // Wait until user has finished typing before publishin
            .sink(receiveValue: { str in
                if str.isEmpty {
                    // Reset data
                    self.fetchedPlayers = [PlayerViewModel]()
                    self.fetchedTeams = [TeamViewModel]()
                    self.state = .newSearch // If search string is empty we are ready for a new search
                } else {
                    self.playersExpandable = false // Reset players expandable
                    self.state = .midSearch // At this point we are ready to search
                    
                    // Search players
                    let playerParams = SearchType.players.params(str: str, offset: nil)
                    self.searchPlayers(params: playerParams)
                    
                    // Search teams
                    let teamParams = SearchType.teams.params(str: str, offset: nil)
                    self.searchTeams(params: teamParams)
                }
                self.resetOffsets()
                self.searches = Constants.startingSearches
                self.playersRechecked = false
                self.teamsRechecked = false
            })
            .store(in: &cancellables)
    }
    
    private func setupSearchStatePublisher() {
        $searches
            .sink { numberOfSearches in
                if numberOfSearches == 2 && self.fetchedPlayers.isEmpty && self.fetchedTeams.isEmpty {
                    self.state = .searchFinishedWithNoResults
                } else if numberOfSearches == 2 {
                    self.state = .searchFinishedWithResults
                }
            }
            .store(in: &cancellables)
    }
    
    func rechCheckFavourites() {
        for player in fetchedPlayers {
            player.isFavourite = player.checkIfFavourite()
        }
    }
    
    /// We use this to configure the more results button once a re-check is complete
    private func handleCheckOnlyCompletion(completion: Subscribers.Completion<Error>, expandableTracker: inout Bool, checkTracker: inout Bool) {
        switch completion {
        case .failure:
            expandableTracker = false
            
        case .finished:
            expandableTracker = true
        }
        checkTracker = true
    }

    // TODO: I would like to refactor the following methods relating to player searches etc. to be generic to avoid repetition
    private func searchPlayers(params: SearchQuery, checkOnly: Bool = false) {
        self.webservice.fetchResults(expecting: PlayerResponse.self, query: params)
            .map {
                return $0.result.players.map {
                    PlayerViewModel($0)
                }
            }
            .sink { completion in
                
                if checkOnly {
                    self.handleCheckOnlyCompletion(completion: completion, expandableTracker: &self.playersExpandable, checkTracker: &self.playersRechecked)
                }

                self.searches += 1

            } receiveValue: { players in
                if params.offset != nil {
                    if !checkOnly {
                        self.fetchedPlayers += players
                    }
                } else {
                    self.fetchedPlayers = players
                }
                
                // Once results are retrieved, we check for more results
                // We only need to re-check if there are at least 10 players in the fetched list and
                // the total is a multiple of 10
                if !self.playersRechecked {
                    self.recheckPlayers()
                }
            }
            .store(in: &self.cancellables)
    }

    private func searchTeams(params: SearchQuery, checkOnly: Bool = false) {
        self.webservice.fetchResults(expecting: TeamResponse.self, query: params)
            .map {
                return $0.result.teams.map {
                    TeamViewModel($0)
                }
            }
            .sink { completion in
                
                if checkOnly {
                    self.handleCheckOnlyCompletion(completion: completion, expandableTracker: &self.teamsExpandable, checkTracker: &self.teamsRechecked)
                }

                self.searches += 1

            } receiveValue: { teams in
                if params.offset != nil {
                    if !checkOnly {
                        self.fetchedTeams += teams
                    }
                } else {
                    self.fetchedTeams = teams
                }
                
                // Once results are retrieved, we check for more results
                // We only need to re-check if there are at least 10 players in the fetched list and
                // the total is a multiple of 10
                if !self.teamsRechecked {
                    self.recheckTeams()
                }
            }
            .store(in: &self.cancellables)
    }

    /// On the following 2 methods, we pass in the checkOnly param to the search function. This ensures that
    /// results are not then added to the fetched list
    
    func recheckPlayers() {
        self.playerOffset += Constants.searchIncrement
        let params = SearchType.players.params(str: searchQuery, offset: playerOffset)
        self.searchPlayers(params: params, checkOnly: true)
    }
    
    func recheckTeams() {
        self.teamOffset += Constants.searchIncrement
        let params = SearchType.teams.params(str: searchQuery, offset: teamOffset)
        self.searchTeams(params: params, checkOnly: true)
    }
    
    func getMorePlayers() {
        self.playersRechecked = false
        self.playerOffset += Constants.searchIncrement
        let params = SearchType.players.params(str: searchQuery, offset: playerOffset)
        self.searchPlayers(params: params)
    }

    func getMoreTeams() {
        self.teamsRechecked = false
        self.teamOffset += Constants.searchIncrement
        let params = SearchType.teams.params(str: searchQuery, offset: self.teamOffset)
        self.searchTeams(params: params)
    }
}
