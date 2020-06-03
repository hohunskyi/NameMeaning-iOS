//
//  HomeViewController.swift
//  NameMeaning
//
//  Created by Vladimir Gogunsky on 5/17/20.
//  Copyright © 2020 Volodymyr Hohunskyi. All rights reserved.
//
import UIKit


final class HomeViewController: UIViewController {

    @IBAction func showList() {
        guard let viewController = ListViewControllerFactory().make() else { return }
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
