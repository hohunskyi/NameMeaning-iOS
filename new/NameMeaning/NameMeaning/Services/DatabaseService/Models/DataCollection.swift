//
//  DataCollection.swift
//  NameMeaning
//
//  Created by Vladimir Gogunsky on 5/17/20.
//  Copyright © 2020 Volodymyr Hohunskyi. All rights reserved.
//

struct DataCollection {

    struct Keys {
        static let names = "names"
        static let males = "males"
        static let females = "females"
        static let unisex = "unisexs"
        static let origins = "origins"
    }


    var origins : [Origin] = []
    var allNames : [Name] = []

    var boyNames : [Name] {
        return self.allNames.filter { $0.sex == .boy }
    }

    var girlNames : [Name] {
        return self.allNames.filter { $0.sex == .girl }
    }

    var unisexNames : [Name] {
        return self.allNames.filter { $0.sex == .unisex }
    }
}
