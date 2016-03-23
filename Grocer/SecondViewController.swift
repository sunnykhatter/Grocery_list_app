//
//  SecondViewController.swift
//  Grocer
//
//  Created by Lakshay Khatter on 2016-03-09.
//  Copyright © 2016 lkhatter. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    
    var factual_API = FactualAPI()
    var data = [String]()//FactualAPI().queryProducts()//[String]()

    

   
    var searchActive : Bool = false
//    var data = ["Avacodo","Carrots","Lettuce","Cucumbers","Oreo Cookies","Potatos","Cheese"]
    var filtered:[String] = []
    
    
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
//         var data = FactualAPI().queryProducts()
        
        super.viewDidLoad()
        /* Setup delegates */
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searchActive) {
            return filtered.count
        }
        return data.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell!;
            cell.textLabel?.text = data[indexPath.row];
        
        
        return cell;
    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        searchActive = true;
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        searchBar.endEditing(true)

    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.endEditing(true)

    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        FactualAPI().queryProducts(searchBar.text!){
            arrayProducts in
            // doing something, arrayProduct is temp array
            self.data = arrayProducts
            self.tableView.reloadData()
        }

        searchActive = false;
    }
    
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        filtered = data.filter({ (text) -> Bool in
            let tmp: NSString = text
            let range = tmp.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
            return range.location != NSNotFound
        })
        if(filtered.count == 0){
            searchActive = false;
        } else {
            searchActive = true;
        }
        self.tableView.reloadData()
    }

    
    

}

