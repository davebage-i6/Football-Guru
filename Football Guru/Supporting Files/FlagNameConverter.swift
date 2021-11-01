//
//  MapNameConverter.swift
//  Football Guru
//
//  Created by Dave Bage on 30/10/2021.
//

import Foundation
import SwiftUI

class MapNameConverter {
   let flagsDictionary = [
    "American Samoa" : "american_samoa",
    "Antigua and Barbuda" : "antigua_and_barbuda",
    "Aruba" : "aruba",
    "Basque Country" : "basque_country",
    "Belgium" : "belgium",
    "Bolivia" : "bolivia",
    "Bosnia and Herzegovina" : "bosnia_and_herzegovina",
    "Burkina Faso" : "burkina_faso",
    "Canary Islands" : "canary_islands",
    "Cayman Islands" : "cayman_islands",
    "Cape Verde" : "cape_verde",
    "Central African R" : "central_african_republic",
    "Chinese Taipei" : "taiwan",
    "Congo" : "democratic_republic_of_the_congo",
    "Costa Rica" : "costa_rica",
    "Curaçao" : "curacao",
    "Czech Republic" : "czech_republic",
    "Dominican Republic" : "dominican_republic",
    "DR Congo" : "democratic_republic_of_the_congo",
    "East Timor" : "east_timor",
    "El Salvador" : "el_salvador",
    "England" : "england",
    "Equatorial Guinea" : "equatorial_guinea",
    "Faroe Islands" : "faroes",
    "France" : "france",
    "French Guiana" : "french_guiana",
    "Hong Kong" : "hong_kong",
    "Ireland" : "ireland",
    "Ivory Coast" : "cote_divoire",
    "Germany" : "germany",
    "Martinica" : "martinique",
    "Mexico" : "mexico",
    "Netherlands Antilles" : "netherlands_antilles",
    "New Caledonia" : "new_caledonia",
    "New Zealand" : "new_zealand",
    "North Korea" : "north_korea",
    "Northern Cyprus" : "northern_cyprus",
    "Northern Ireland" : "northern_ireland",
    "Northern Mariana" : "northern_mariana_islands",
    "Papua New Guinea" : "papua_new_guinea",
    "Puerto Rico" : "puerto_rico",
    "Republic of Ireland" : "ireland",
    "Réunion" : "france",
    "Saint Lucia" : "saint_lucia",
    "Saint Kitts and Nevis" : "saint_kitts_and_nevis",
    "Saint Vincent" : "saint_vincent_and_the_grenadines",
    "San Marino" : "san_marino",
    "São Tomé and Príncipe" : "sao_tome_and_principe",
    "Saudi Arabia" : "saudi_arabia",
    "Sierra Leone" : "sierra_leone",
    "Solomon Islands" : "solomon_islands",
    "South Africa" : "south_africa",
    "South Korea" : "south_korea",
    //"South Yemen" : "",
    "Sri Lanka" : "sri_lanka",
    "Tibet" : "China",
    "Trinidad and Tobago" : "trinidad_and_tobago",
    "Turks & Caicos Islands" : "turks_and_caicos_islands",
    "United Arab Emirates" : "united_arab_emirates",
    "United States" : "united_states",
    "Wallis & Futuna" : "wallis_and_futuna",
    "Zanzibar" : "tanzania"
    ]
    
    func flagImageName(nationality: String) -> Image {
        if let flagImageName = flagsDictionary[nationality] {
            return Image(flagImageName)
        }
        return Image("China")
    }
}
