//
//  ViewController.swift
//  JSONParsing
//
//  Created by Rithishkesav Saravanan on 03/05/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=dc3f7445647046239de67ba2cf4ff7a9")
        
        guard url != nil else{
            print("The API call returned an error")
            return
        }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            //checking for errors
            if error == nil && data != nil{
                //Parse JSON
                let decoder = JSONDecoder()
                
                do{
                    let newsFeed = try decoder.decode(NewsFeed.self, from: data!)
                    print(newsFeed)
                }
                catch{
                    print("Error in JSON Parsing")
                }
                
            }
        }
        
        dataTask.resume()
        
    }


}

