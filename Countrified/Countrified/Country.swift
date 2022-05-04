//
//  Country.swift
//  Countrified
//
//  Created by Daniel Senga on 2022/05/01.
//

import Foundation
// MARK: - Country
struct Country: Codable, Comparable {
    static func < (lhs: Country, rhs: Country) -> Bool {
        return lhs.name.common < rhs.name.common
    }
    
    static func == (lhs: Country, rhs: Country) -> Bool {
        return lhs.name.common == lhs.name.common
    }
    
    var name: Name
    var capital: [String]?
    var population: Int
    var flag: String?
    var subregion: String?
    var independent: Bool?
    var fifa: String?
    

}

// MARK: - CoatOfArms

// MARK: - CodingKey
enum CodingKeys: String, CodingKey {
    case subregion
}

// MARK: - Name
struct Name: Codable {
    var common: String
    var official: String
    var nativeName: [String: Translation]?

    enum CodingKeys: String, CodingKey {
        case common
        case official
        case nativeName
    }
}

// MARK: - Translation
struct Translation: Codable {
    var official: String
    var common: String

    enum CodingKeys: String, CodingKey {
        case official
        case common
    }
}

