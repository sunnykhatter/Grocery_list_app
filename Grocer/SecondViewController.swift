//
//  SecondViewController.swift
//  Grocer
//
//  Created by Lakshay Khatter on 2016-03-09.
//  Copyright © 2016 lkhatter. All rights reserved.
//

import UIKit
import OAuthSwift

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    
    var factual_API = FactualAPI()
    var data = [String]()
    var list_json: JSON!


    var searchActive : Bool = false
    var filtered:[String] = []
    

    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
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
        searchActive = false;
        self.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchActive = false;
        searchBar.showsCancelButton = false
        searchBar.text = ""
        searchBar.resignFirstResponder()

    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        FactualAPI().queryProducts(searchBar.text!){
            arrayProducts in
            self.list_json = arrayProducts
            var final = [String]()
            
            
            if  arrayProducts["status"].stringValue == "ok" {
                // we're OK to parse!
                for result in arrayProducts["response"]["data"].arrayValue {
                    final.append(result["product_name"].stringValue)
                }
                self.data = final
            }
            
            self.tableView.reloadData()
        }
    searchBar.resignFirstResponder()
        
        searchActive = false;
        
    }
    
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        filtered = data.filter({ (text) -> Bool in
            let tmp: NSString = text
            let range = tmp.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch); return range.location != NSNotFound })
        
        if (filtered.count == 0){
            searchActive = false;
        } else {
            searchActive = true;
            self.searchBar.resignFirstResponder()
        }
        self.tableView.reloadData()
    }

    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        return indexPath
    }
    

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var segueID = segue.identifier
        
        if(segueID! == "show_item"){
            var yourVC:ItemViewController = segue.destinationViewController as! ItemViewController
            self.searchBar.resignFirstResponder()
            var indexPath = self.tableView.indexPathForSelectedRow!
            // Pass the single peice of JSON to the next view
            yourVC.receivedJSON = list_json["response"]["data"].arrayValue[indexPath.row]
        }
    }
    

}


