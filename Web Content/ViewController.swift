//
//  ViewController.swift
//  Web Content
//
//  Created by Stephen on 30/07/2016.
//  Copyright © 2016 luminator.technology.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Remember: allow arbitary loads
        // http://stackoverflow.com/questions/31254725/transport-security-has-blocked-a-cleartext-http
        
        if let url = URL(string: "https://stackoverflow.com") {
            //if let url = URL(string: "https://google.co.uk") {
            let request = NSMutableURLRequest(url: url)
            
            let task = URLSession.shared.dataTask(with: request as URLRequest){
                data, response, error in
                
                if error != nil {
                    print(error)
                } else {
                    if let unwrappedData = data {
                        let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                        
                        print(dataString)
                        
                        // This is an async task so update UI now...
                        DispatchQueue.main.sync(execute: {
                            // Update uI
                        })
                    }
                }
            }
            task.resume()

        }
        
        //webView.loadRequest(URLRequest(url: url))
        webView.loadHTMLString("<h1>Hello there!</h1>", baseURL: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

