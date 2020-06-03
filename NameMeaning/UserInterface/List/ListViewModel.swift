//
//  ListViewModel.swift
//  NameMeaning
//
//  Created by Vladimir Gogunsky on 03.06.2020.
//  Copyright © 2020 Volodymyr Hohunskyi. All rights reserved.
//

protocol ListViewModelType {
    var items: [Name] { get }
}

struct ListViewModel: ListViewModelType {

    enum Gender {
        case boy
        case girl
        case unisex
        case all
    }

    var names: [Name] = []
    var gender: Gender = .all
    var searchString: String? = nil

    var items: [Name] {
        guard let searchString = searchString else { return self.names }
        return self.names.filter { $0.name.contains(searchString) }
    }

    init(data: DataCollection) {
        self.names = self.filter(for: data)
    }

    func filter(for data: DataCollection) -> [Name] {
        switch self.gender {
        case .all:
            return data.allNames
        case .boy:
            return data.boyNames
        case .girl:
            return data.girlNames
        case .unisex:
            return data.unisexNames
        }
    }
}
