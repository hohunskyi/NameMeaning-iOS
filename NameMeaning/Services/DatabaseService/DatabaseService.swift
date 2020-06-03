//
//  DatabaseService.swift
//  NameMeaning
//
//  Created by Vladimir Gogunsky on 5/17/20.
//  Copyright © 2020 Volodymyr Hohunskyi. All rights reserved.
//

import Foundation

final class DatabaseService {

    static let shared = DatabaseService()

    lazy var dataCollection: DataCollection = {
        DataCollection(origins: self.parsedOriginData(), allNames: self.parsedNameData())
    }()


    func originByID(id : String) -> Origin? {
        return self.dataCollection.origins.first { $0.id == id }
    }

    func recomendedByIDs(ids : [String]) -> [Name] {
        return self.dataCollection.allNames.filter { ids.contains($0.id)}
    }

    private func parsedOriginData() -> [Origin] {
        guard let originsData = self.data(for: "origins") as? [[String: String]] else { return [] }
        return originsData.compactMap(Origin.init)
    }

    private func parsedNameData() -> [Name] {
         guard let originsData = self.data(for: "data") as? [[String: Any]] else { return [] }
         return originsData.compactMap(Name.init)
     }

    private func data(for fileName: String) -> Any? {
        if let path = Bundle.main.path(forResource: fileName, ofType: "json"),
            let data = NSData(contentsOfFile: path) {
            let origins = try? JSONSerialization.jsonObject(with: data as Data, options: .allowFragments)
            return origins
        }

        return nil
    }
}
