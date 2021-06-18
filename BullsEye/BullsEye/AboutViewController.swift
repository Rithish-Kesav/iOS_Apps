//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Rithishkesav Saravanan on 04/05/21.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let htmlPath = Bundle.main.path(forResource: "BullsEye", ofType: "html"){
            
            let url = URL(fileURLWithPath: htmlPath)
            let request = URLRequest(url: url)
            webView.load(request)
        }

    }
    
    @IBOutlet weak var webView: WKWebView!
    
    
    @IBAction func closeButton(){
        dismiss(animated: true, completion: nil)
    }

}
