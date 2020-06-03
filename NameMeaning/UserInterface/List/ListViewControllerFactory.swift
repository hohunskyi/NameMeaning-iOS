//
//  ListViewControllerFactory.swift
//  NameMeaning
//
//  Created by Vladimir Gogunsky on 04.06.2020.
//  Copyright © 2020 Volodymyr Hohunskyi. All rights reserved.
//
import UIKit

struct ListViewControllerFactory {

    func make() -> ListViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ListViewController") as? ListViewController
        vc?.viewModel = ListViewModel(data: DatabaseService.shared.dataCollection)
        return vc
    }
}
