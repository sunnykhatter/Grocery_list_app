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

    @IBOutlet weak var Item_info_label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var category = "Category: " +  receivedJSON["category"].string! + "\n"
        var brand = "Brand: " +  receivedJSON["product_name"].string! + "\n"
        
        var final = category + brand
        
        Item_info_label.text = final
        
        
        /*
        
        "category" : "Dog Food",
        "upc" : "050000352845",
        "brand" : "Mighty Dog",
        "ean13" : "0050000352845",
        "avg_price" : 0.6899999999999999,
        "product_name" : "Dog Food Senior Turkey & Rice Dinner",
        "factual_id" : "f97238c2-c58a-4238-9b6a-b709325e0d3e",
        "image_urls" : [
        "http:\/\/www.scanavert.com\/api\/picture.php?upc=00050000352845&width=150&height=150"
        ],
        "manufacturer" : "Nestlé S.A." */
        
        var image_urls : [JSON] = receivedJSON["image_urls"].arrayValue
        
        if (image_urls.count > 0) {
            load_image( receivedJSON["image_urls"].arrayValue[0].stringValue)

        } else {
            print("no image")
        }
        
        
        print(receivedJSON)
        product_name.text = receivedJSON["product_name"].stringValue
//        receivedJSON["image_urls"].arrayValue[3]
        

        
    }
    
    @IBOutlet weak var image_element: UIImageView!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func load_image(urlString:String) {
        let imgURL: NSURL = NSURL(string: urlString)!
        let request: NSURLRequest = NSURLRequest(URL: imgURL)
        
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request){
            (data, response, error) -> Void in
            
            if (error == nil && data != nil)
            {
                func display_image()
                {
                    self.image_element.image = UIImage(data: data!)
                }
                
                dispatch_async(dispatch_get_main_queue(), display_image)
            }
            
        }
        
        task.resume()
    }

}

