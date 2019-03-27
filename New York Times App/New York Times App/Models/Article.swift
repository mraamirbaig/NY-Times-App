//
//  Article.swift
//  New York Times App
//
//  Created by Aamir Baig on 3/26/19.
//  Copyright © 2019 Aamir Baig. All rights reserved.
//

import Foundation

struct Article {
    
    var _id: Int
    var title: String
    var publishedDate: String
    var byLine: String!
    var url: String?
    var media: [Media]?
    
    init(_id: Int, title: String, publishedDate: String) {
        
        self._id = _id
        self.title = title
        self.publishedDate = publishedDate
    }
}
