//
//  AddFriendsViewController.swift
//  Grocer
//
//  Created by Lakshay Khatter on 2016-03-09.
//  Copyright © 2016 lkhatter. All rights reserved.
//

import UIKit

class AddFriendsViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBAction func stop_bar(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: {});
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    @IBAction func add_friend(sender: AnyObject) {
        names.append(textField.text!)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
