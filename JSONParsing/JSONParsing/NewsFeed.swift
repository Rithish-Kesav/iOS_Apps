//
//  NewsFeed.swift
//  JSONParsing
//
//  Created by Rithishkesav Saravanan on 03/05/21.
//

import Foundation

struct NewsFeed: Codable{
    
    var status:String = ""
    var totalResults:Int = 0
    var article:[ArticleDefinition]?
}
