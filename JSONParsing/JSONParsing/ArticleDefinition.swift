//
//  ArticleDefinition.swift
//  JSONParsing
//
//  Created by Rithishkesav Saravanan on 03/05/21.
//

import Foundation

struct ArticleDefinition: Codable{
    
    //var source:[ArticleDefinition]
    var author:String?
    var title:String?
    var description:String?
    var url:String?
    var urlToImage:String?
    var publishedAt:String?
    var content:String?
}
