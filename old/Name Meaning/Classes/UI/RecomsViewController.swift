//
//  RecomsViewController.swift
//  Name Meaning
//
//  Created by Alenka Hohunska on 5/3/16.
//  Copyright © 2016 Hohunskyi. All rights reserved.
//

import UIKit

class RecomsViewController : BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var items : NSArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setBackButtonItem()
        
        title = NSLocalizedString("Recommendations", comment: "")
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44.0
        tableView.registerNib(UINib(nibName: "DetailsTitleTableViewCell", bundle: nil), forCellReuseIdentifier: "DetailsTitleTableViewCell")

    }
    
    func setBackButtonItem() {
        let backButton = UIBarButtonItem(title:  NSLocalizedString("Back", comment: ""), style: .Plain, target: self, action: #selector(NamesViewController.backAction))
        navigationItem.backBarButtonItem = backButton
    }
    
    func backAction() {
        navigationController?.popViewControllerAnimated(true)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items!.count
    }
    
    // create a cell for each table view row
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let info = items![indexPath.row] as! Name
        let cell = tableView.dequeueReusableCellWithIdentifier("DetailsTitleTableViewCell") as! DetailsBaseTableViewCell?
        cell?.update(info)
        
        return cell!
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20.0
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView(frame: CGRectZero)
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView(frame: CGRectZero)
    }
    
    
    // method to run when table view cell is tapped
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("ShowDetails", sender: self)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowDetails" {
            let vc : DetailsViewController = segue.destinationViewController as! DetailsViewController
            vc.name = items![(tableView.indexPathForSelectedRow?.row)!] as? Name
        }
    }
}
