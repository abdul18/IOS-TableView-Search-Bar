//
//  ViewController.swift
//  tableViewSearch
//
//  Created by Yosemite on 28/10/15.
//  Copyright (c) 2015 Pavaratha. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UISearchDisplayDelegate, UISearchBarDelegate {
    
    var countryList = [String]()
    var searchCountryList = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //        UITableView
        countryList =  ["USA", "Bahamas", "Brazil", "Canada", "Republic of China", "Cuba", "Egypt", "Fiji", "France", "Germany", "Iceland", "India", "Indonesia", "Jamaica", "Kenya", "Madagascar", "Mexico", "Nepal", "Oman", "Pakistan", "Poland", "Singapore", "Somalia", "Switzerland", "Turkey", "UAE", "Vatican City"]
        tableView.reloadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
        
    {
        return countryList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
        
    {
        var cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        
        var countryName : String!
        if tableView == self.searchDisplayController!.searchResultsTableView {
            countryName = searchCountryList[indexPath.row]
        } else {
            countryName = countryList[indexPath.row]
        }


        cell.textLabel?.text = countryList[indexPath.row]
        return cell
    }
    
    func filterTableViewForEnterText(searchText: String)
    {
        self.searchCountryList = self.countryList.filter({(strCountry : String) -> Bool in
            
            var searchString = strCountry.rangeOfString(searchText)
            return (searchString != nil)
        })
    }
    
    
    func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchString searchString: String?) -> Bool
    {
        self.filterTableViewForEnterText(searchString!)
        return true
    }
    func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchScope searchOption: Int)
        -> Bool
    {
        self.filterTableViewForEnterText(String(stringInterpolationSegment: self.searchDisplayController!.searchBar.text))
        return true
    }
    
}

