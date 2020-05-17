//
//  DetailsViewController.swift
//  Name Meaning
//
//  Created by Alenka Hohunska on 5/3/16.
//  Copyright © 2016 Hohunskyi. All rights reserved.
//

import UIKit

class DetailsViewController: BaseViewController {

    class Section : NSObject {
        var cells = NSMutableArray()
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    let cells = ["DetailsTitleTableViewCell",
                 "DetailsSexTableViewCell",
                 "DetailsMeaningTableViewCell",
                 "DetailsNotesTableViewCell",
                 "DetailsOriginTableViewCell",
                 "DetailsStatsTableViewCell",
                 "DetailsRecomsTableViewCell",
                 "DetailsOverviewTableViewCell"]
    
    var sections = NSMutableArray()
    
    var name : Name?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        title = NSLocalizedString("Details", comment: "")
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44.0
        
        for cell in cells {
            tableView.registerNib(UINib(nibName: cell, bundle: nil), forCellReuseIdentifier: cell)
        }
        
        setBackButtonItem()
        buildSections()
        createAndLoadInterstitial()
    }
    
    func setBackButtonItem() {
        let backButton = UIBarButtonItem(title: NSLocalizedString("Back", comment: ""), style: .Plain, target: self, action: #selector(NamesViewController.backAction))
        navigationItem.backBarButtonItem = backButton
    }
    
    func backAction() {
        navigationController?.popViewControllerAnimated(true)
    }
    
    func buildSections() {
        
        let infoSection = Section()
        infoSection.cells.addObject(["class" : "DetailsTitleTableViewCell"])
        infoSection.cells.addObject(["class" : "DetailsSexTableViewCell"])

        if !(name?.meaning.isEqualToString(""))! {
            infoSection.cells.addObject(["class" : "DetailsMeaningTableViewCell"])
        }
        
        if !(name?.notes.isEqualToString(""))! {
            infoSection.cells.addObject(["class" : "DetailsNotesTableViewCell"])
        }
        
        if !(name?.origin.isEqualToString(""))! {
            infoSection.cells.addObject(["class" : "DetailsOriginTableViewCell"])
        }
        
        sections.addObject(infoSection)
    
        if !(name?.overview.isEqualToString(""))! {
            let overviewSection = Section()
            overviewSection.cells.addObject(["class" : "DetailsOverviewTableViewCell"])
            sections.addObject(overviewSection)
        }
        
        if name?.stats.data.count > 2 {
            let statsSection = Section()
            statsSection.cells.addObject(["class" : "DetailsStatsTableViewCell", "segueIdentifier" : "ShowStats"])
            sections.addObject(statsSection)
        }
        
        if name?.recommended.count > 0 {
            let recomsSection = Section()
            recomsSection.cells.addObject(["class" : "DetailsRecomsTableViewCell", "segueIdentifier" : "ShowRecoms"])
            sections.addObject(recomsSection)
        }
        
        tableView.reloadData()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = sections[section] as! Section
        return section.cells.count
    }
    
    // create a cell for each table view row
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let section = sections[indexPath.section] as! Section
        let info = section.cells[indexPath.row] as! NSDictionary
        let cell = tableView.dequeueReusableCellWithIdentifier(info["class"] as! String) as! DetailsBaseTableViewCell?
        cell?.update(name!)
        
        return cell!
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20.0
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView(frame: CGRectZero)
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return sections.count - 1 == section ? 20 :  0.1
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView(frame: CGRectZero)
    }
    
    
    // method to run when table view cell is tapped
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let section = sections[indexPath.section] as! Section
        let info = section.cells[indexPath.row] as! NSDictionary
        
        if let segueIdentifier = info["segueIdentifier"] {
            performSegueWithIdentifier(segueIdentifier as! String, sender: self)
        }
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowStats" {
            let vc : StatsViewController = segue.destinationViewController as! StatsViewController
            vc.stats = name?.stats
        } else if segue.identifier == "ShowRecoms" {
            let vc : RecomsViewController = segue.destinationViewController as! RecomsViewController
            vc.items = DataManager.sharedInstance.recomendedByIDs((name?.recommended)!)
        }
    }
}
