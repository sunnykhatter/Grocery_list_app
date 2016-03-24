//
//  ItemViewController.swift
//  Grocer
//
//  Created by Lakshay Khatter on 2016-03-23.
//  Copyright © 2016 lkhatter. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {
    
    
    @IBOutlet weak var product_name: UILabel!
    
    
    var receivedJSON:JSON!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        product_name.text = receivedJSON["product_name"].stringValue
        
//            print()
//        print(receivedJSON.dictionary)
        
//        for result in receivedJSON {
//            print(result.0)
//        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

