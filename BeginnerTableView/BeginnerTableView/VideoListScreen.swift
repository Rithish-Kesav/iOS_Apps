//
//  VideoListScreen.swift
//  BeginnerTableView
//
//  Created by Rithishkesav Saravanan on 26/03/21.
//

import UIKit

class VideoListScreen: UIViewController {
    
    var VideoArray: [Video] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        VideoArray = CreateArray()
    }
         func CreateArray() -> [Video]{
            var tempVideos: [Video] = []
        
            let video1 = Video(image: Coffeemug, title: "Coffee Mug")
            let video2 = Video(image: feather, title: "Feather")
            let video3 = Video(image: Fish, title: "Fish")
            let video4 = Video(image: Honeybee, title: "Honeybee")
            let video5 = Video(image: Lighthouse-Portsmouth-NH, title: "Lighthouse")
            let video6 = Video(image: Tent, title: "Tent")
            
            tempVideos.append(video1)
            tempVideos.append(video2)
            tempVideos.append(video3)
            tempVideos.append(video4)
            tempVideos.append(video5)
            tempVideos.append(video6)
            
            return tempVideos
        
    }
}
