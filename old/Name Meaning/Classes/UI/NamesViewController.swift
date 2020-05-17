//
//  NamesViewController.swift
//  Name Meaning
//
//  Created by Alenka Hohunska on 5/3/16.
//  Copyright © 2016 Hohunskyi. All rights reserved.
//

import UIKit
import ScrollPager
import AMScrollingNavbar

class NamesViewController: BaseViewController, UISearchBarDelegate, UIScrollViewDelegate, ScrollPagerDelegate, UIViewControllerPreviewingDelegate {

    @IBOutlet weak var scrollPager: ScrollPager!
    @IBOutlet weak var tableView: UITableView!
    
    var tabs : [String] = []
    var selectedTabIndex = -1
    
    var searchBar : UISearchBar!
    var items : NSArray?
    var firstTouch : CGPoint = CGPointZero
    var lastTouch : CGPoint = CGPointZero
    var touchTime : NSTimeInterval = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = NSLocalizedString("The Name's Meaning", comment: "")
              
        setBackButtonItem()
        setTableView()
        setTabs()
        setScrollPager()
        setSearchBar()
    }
    
    func setTableView() {
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        if #available(iOS 9.0, *) {
            if( traitCollection.forceTouchCapability == .Available){
                registerForPreviewingWithDelegate(self, sourceView: tableView)
            }
        }
    }
    
    func setTabs() {
        if DataManager.sharedInstance.data?.maleNames.count > 0 {
            tabs.append(NSLocalizedString("Male", comment: ""))
        }
        
        if DataManager.sharedInstance.data?.femaleNames.count > 0 {
            tabs.append(NSLocalizedString("Female", comment: ""))
        }
        
        if DataManager.sharedInstance.data?.unisexNames.count > 0 {
            tabs.append(NSLocalizedString("Unisex", comment: ""))
        }
    }
    
    func setScrollPager() {
        scrollPager.addSegmentsWithTitles(tabs)
        scrollPager.backgroundColor = DataManager.sharedInstance.config?.targetParams.appPrimaryColor
        scrollPager.font = UIFont.systemFontOfSize(16)
        scrollPager.selectedFont = UIFont.boldSystemFontOfSize(16)
        scrollPager.delegate = self
        
        scrollPager(scrollPager, changedIndex: 0)
    }
    
    func setSearchBar() {
        searchBar = UISearchBar(frame: CGRectMake(0,0,self.view.frame.size.width, 44))
        searchBar.delegate = self
        searchBar.barTintColor = UIColor.whiteColor()
        searchBar.backgroundImage = UIImage()
        searchBar.translucent = true
        searchBar.showsCancelButton = true
        searchBar.searchBarStyle = .Minimal
        
        let textFieldInsideSearchBar = searchBar.valueForKey("searchField") as? UITextField
        textFieldInsideSearchBar?.textColor = UIColor.whiteColor()
        textFieldInsideSearchBar?.font = UIFont.systemFontOfSize(16)
        
        self.searchBar.setImage(UIImage(named: "search")!, forSearchBarIcon: UISearchBarIcon.Search, state: UIControlState.Normal)
        self.searchBar.setImage(UIImage(named: "close")!, forSearchBarIcon: UISearchBarIcon.Clear, state: UIControlState.Normal)
        self.searchBar.setImage(UIImage(named: "close")!, forSearchBarIcon: UISearchBarIcon.Clear, state: UIControlState.Highlighted)
        
        hideSearchBar()
    }
    
    func scrollPager(scrollPager: ScrollPager, changedIndex: Int) {
        
        if selectedTabIndex != changedIndex {
            
            items = itemsForIndex(changedIndex)

            selectedTabIndex = changedIndex
            
            if let searchText = searchBar?.text {
                if !searchText.isEmpty {
                    applySearchString(searchBar.text!)
                } else {
                    tableView.reloadData()
                }
            }
        }
    }
    
    func itemsForIndex(index : Int) -> NSArray {
        let data : Data = DataManager.sharedInstance.data!
        switch index {
        case 0:
            return data.maleNames
        case 1:
            return data.femaleNames
        case 2:
            return data.unisexNames
        default:
            return NSArray()
        }
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        applySearchString(searchText)
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.text = ""
        hideSearchBar()
        updateTableViewWithOriginalData()
    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        firstTouch = CGPointZero
        lastTouch = CGPointZero
        touchTime = 0
    }
    
    func setBackButtonItem() {
        let backButton = UIBarButtonItem(title: NSLocalizedString("Back", comment: ""), style: .Plain, target: self, action: #selector(NamesViewController.backAction))
        navigationItem.backBarButtonItem = backButton
    }
    
    func backAction() {
        navigationController?.popViewControllerAnimated(true)
    }
    
    func showSearchBar() {
        navigationItem.rightBarButtonItem = nil
        navigationItem.titleView = searchBar
        searchBar.becomeFirstResponder()
    }
    
    func hideSearchBar() {
        let searchButton = UIBarButtonItem(image: UIImage(named: "icon_search"),
                                           style: .Plain,
                                           target: self,
                                           action: #selector(NamesViewController.showSearchBar))
        navigationItem.rightBarButtonItem = searchButton
        navigationItem.titleView = nil
        
    }
    
    func applySearchString(string : NSString) {
        if string.length > 0 {
            items = itemsForIndex(selectedTabIndex).filteredArrayUsingPredicate(NSPredicate(format: "(name CONTAINS[cd] %@) OR (meaning CONTAINS[cd] %@)", string, string))
            tableView.reloadData()
        } else {
            updateTableViewWithOriginalData()
        }
    }
   
    func updateTableViewWithOriginalData() {
        let index = selectedTabIndex
        selectedTabIndex = -1
        scrollPager(scrollPager, changedIndex: index)
    }

    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let navigationController = self.navigationController as? ScrollingNavigationController {
            navigationController.followScrollView(tableView, delay: 0)
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)

        if let navigationController = self.navigationController as? ScrollingNavigationController {
            navigationController.showNavbar(animated: true)
            navigationController.stopFollowingScrollView()
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let items = self.items {
            return items.count
        }
        return 0
        
    }
    
    // create a cell for each table view row
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell?
        cell?.accessoryType = .DisclosureIndicator
        
        cell?.textLabel?.text = (items![indexPath.row] as! Name).name as String
        
        if indexPath.row % 2 == 0 {
            cell?.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.0)
        } else {
            cell?.backgroundColor = UIColor(red: 0.968, green: 0.968, blue: 0.968, alpha: 1.0)
        }
        
        return cell!
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
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowDetails" {
            let vc : DetailsViewController = segue.destinationViewController as! DetailsViewController
            vc.name = items![(tableView.indexPathForSelectedRow?.row)!] as? Name
        }
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        if searchBar.isFirstResponder() {
            firstTouch = scrollView.contentOffset
        }
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let currentTime = NSDate().timeIntervalSinceReferenceDate
        let diff = currentTime - touchTime
        if diff > 0.1 {
            let dist = scrollView.contentOffset.y - lastTouch.y
            let speed = dist * 10 / 100
            if fabs(speed) >  6.0 && firstTouch.y - scrollView.contentOffset.y > 50 && firstTouch.y != 0 {
                if searchBar.isFirstResponder() {
                    searchBar.resignFirstResponder()
                }
            }
            lastTouch = scrollView.contentOffset
            touchTime = currentTime
        }
    }
    
    func previewingContext(previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        guard let indexPath = tableView?.indexPathForRowAtPoint(location) else { return nil }
        guard let cell = tableView?.cellForRowAtIndexPath(indexPath) else { return nil }

        guard let detailVC = storyboard?.instantiateViewControllerWithIdentifier("DetailsViewController") as? DetailsViewController else { return nil }
        
        detailVC.name =  items![indexPath.row] as? Name
        
        detailVC.preferredContentSize = CGSize(width: 0.0, height: 500)
        
        if #available(iOS 9.0, *) {
            previewingContext.sourceRect = cell.frame
        }
        
        return detailVC
    }
    
    func previewingContext(previewingContext: UIViewControllerPreviewing, commitViewController viewControllerToCommit: UIViewController) {
        showViewController(viewControllerToCommit, sender: self)
    }
}
