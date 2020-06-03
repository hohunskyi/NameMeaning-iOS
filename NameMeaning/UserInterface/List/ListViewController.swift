//
//  ListViewController.swift
//  NameMeaning
//
//  Created by Vladimir Gogunsky on 5/17/20.
//  Copyright © 2020 Volodymyr Hohunskyi. All rights reserved.
//

import Foundation
import UIKit

final class ListViewController: UIViewController {

    @IBOutlet private var tableView: UITableView!

    var viewModel: ListViewModelType!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = self.viewModel.items[indexPath.row].name
        return cell!
    }


}
