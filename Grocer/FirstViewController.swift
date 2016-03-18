//
//  FirstViewController.swift
//  Grocer
//
//  Created by Lakshay Khatter on 2016-03-09.
//  Copyright © 2016 lkhatter. All rights reserved.
//

import UIKit

var names = ["Lakshay and Kevin", "Kevin and Al", "Lakshay and Al"]

class FirstViewController: UITableViewController {
    
//, UITableViewDataSource, UITableViewDelegate, UIViewController,
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }

    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell!;
        cell.textLabel?.text = names[indexPath.row];
        return cell
    }
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        print(names[indexPath.row])
        return indexPath
    }
    
    
}

