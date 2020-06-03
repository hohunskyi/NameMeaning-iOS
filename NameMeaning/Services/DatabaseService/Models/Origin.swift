//
//  Origin.swift
//  NameMeaning
//
//  Created by Vladimir Gogunsky on 5/17/20.
//  Copyright © 2020 Volodymyr Hohunskyi. All rights reserved.
//

struct Origin {
    
    struct Keys {
        static let id = "id"
        static let name = "name"
        static let continent = "continent"
        static let flag = "flag"

    }
    
    let id : String
    let name : String
    let continent : String
    let flag : String

    init?(dictionary: [String: String]) {

        guard let id = dictionary[Keys.id],
            let name = dictionary[Keys.name],
            let continent = dictionary[Keys.continent],
            let flag = dictionary[Keys.flag]
            else {
                return nil
        }

        self.id = id
        self.name = name
        self.continent = continent
        self.flag = flag
    }
}
