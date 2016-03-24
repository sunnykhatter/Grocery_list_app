//
//  Factual_api.swift
//  Grocer
//
//  Created by Lakshay Khatter on 2016-03-19.
//  Copyright © 2016 lkhatter. All rights reserved.
//

import Foundation
import OAuthSwift



class FactualAPI {
    
let oauthswift = OAuth1Swift(
    consumerKey:    "J7pB7BlLThC208YkGFgNx4MULQYibZHVJbezpLej",
    consumerSecret: "sJjLU3NgxAV2Q56JbEhkvReEmomvyAqpFLeuhJto",
    requestTokenUrl: "",
    authorizeUrl:    "",
    accessTokenUrl:  ""
)

    

    func queryProducts(s1: String, successCallback: (JSON)->Void) {
    var final = [String]()
    self.oauthswift.client.get("http://api.v3.factual.com/t/products-cpg?q=\(s1)",
        success: {
            (data, response) in
            let dataString = NSString(data: data, encoding: NSUTF8StringEncoding)
            let json = JSON(data: data)
            successCallback(json) // callback here
        }
        
        , failure: { error in
            print(error)
    })

}
            
    

}