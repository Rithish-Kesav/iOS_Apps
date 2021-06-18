//
//  ViewController.swift
//  APICall1
//
//  Created by Rithishkesav Saravanan on 02/05/21.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: URL
        let url = URL(string: "https://ocr-text-extractor.p.rapidapi.com/detect-text-from-image-uri")
        
        guard url != nil else{
            print("This URL object is creating an error")
            return
        }
        
        // MARK: URL request
        var request = URLRequest(url: url!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        
        // MARK: Specifying the header
        let header = ["content-type": "application/json",
                      "accept": "string",
                      "x-rapidapi-key": "f1fbd0be86msh52148df1596525dp121970jsn0738c97bab8e",
                      "x-rapidapi-host": "ocr-text-extractor.p.rapidapi.com"]
        
        request.allHTTPHeaderFields = header
        
        // MARK: Specifying the body
        let jsonObject = ["Uri": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-DSQC5TkdfyDj_2ut5Gpt-Qr5qkpUGqOlYw&usqp=CAU",
                          "Language": "string",
                          "DetectOrientation": false,
                          "Scale": false,
                          "IsTable": false,
                          "OcrEngine": "string"] as [String: Any]
        
        //MARK: Converting JSON body to Data Body
        // Since we need to convert the given JSON body into Data body
        do{
            let requestBody = try JSONSerialization.data(withJSONObject: jsonObject, options: .fragmentsAllowed)
            
            request.httpBody = requestBody
        }
        catch{
            print("Error creating the data object from JSON")
        }
        
        // MARK: Setting the request type
        request.httpMethod = "POST"
        
        // MARK: URLSession
        let session = URLSession.shared
        
        // MARK: Creating the data task
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            // Checking for errors
            if error == nil && data != nil{
                //try parsing out the data
                do{
                    let dictionary = try JSONSerialization.jsonObject(with: data! , options: .mutableContainers) as? [String:Any]
                    print(dictionary)
                }
                catch{
                    print("Error parsing the response data")
                }
            }
        }
        
        //MARK: Making the API Call
        // Firing off the datatask -> Making the API call
        dataTask.resume()
    }
    
    
}

