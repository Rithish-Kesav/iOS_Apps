//
//  ViewController.swift
//  CustomTableView
//
//  Created by Rithishkesav Saravanan on 27/03/21.
//

import UIKit

struct CellData{
    let image : UIImage?
    let message : String?
}

class tableViewController: UITableViewController  {
    
    var data = [CellData]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        data = [CellData.init(image: Living-)]
        
    }
    
    //these 2 are functions that are stored automatically witht he tableViewContorller
    //very vital functions to get the tableView set up
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }


}

