//
//  Name.swift
//  NameMeaning
//
//  Created by Vladimir Gogunsky on 5/17/20.
//  Copyright © 2020 Volodymyr Hohunskyi. All rights reserved.
//


enum Sex: String {
    case boy
    case girl
    case unisex
}

struct Stats {

    struct Keys {
        private static let data = "DATA"
    }

    let data : [String: String]

    init?(dictionary : [String: String]?) {
        guard let dictionary = dictionary else { return nil }
        self.data = dictionary
    }
}


struct Name {

    struct Keys {
        static let id = "ZID"
        static let name = "ZNAME"
        static let meaning = "ZMEANING"
        static let rating = "ZRATING"
        static let notes = "ZNOTES"
        static let sex = "ZSEX"
        static let recomendations = "ZRECOMMENTED"
        static let stats = "ZSTATS"
        static let origin = "ZORIGIN"
        static let overview = "ZOVERVIEW"
    }

    let id : String
    let name : String
    let sex : Sex
    let meaning : String
    let origin : String

    let overview : String?
    let rating : Double?
    let stats : Stats?
    let notes  : String?
    let recommendations : [String]


    init?(dictionary: [String: Any]) {

        guard let id = dictionary[Keys.id] as? String,
            let name = dictionary[Keys.name] as? String,
            let sex = dictionary[Keys.sex] as? String,
            let meaning = dictionary[Keys.meaning] as? String,
            let origin = dictionary[Keys.origin] as? String else {
                return nil
        }

        self.id = id
        self.name = name
        self.meaning = meaning
        self.sex = Sex(rawValue: sex) ?? .boy
        self.origin = origin
        self.overview = dictionary[Keys.overview] as? String
        self.stats = Stats(dictionary: dictionary[Keys.stats] as? [String: String])
        self.notes = dictionary[Keys.notes] as? String

        if let ratingString = dictionary[Keys.rating] as? String {
            self.rating = Double(ratingString)
        } else {
            self.rating = nil
        }

        if let recommendationString = dictionary[Keys.recomendations] as? String {
            self.recommendations = recommendationString.split(separator: ",").map(String.init)
        } else {
            self.recommendations = []
        }
    }
}
