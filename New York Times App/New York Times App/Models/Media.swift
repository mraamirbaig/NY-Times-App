//
//  Media.swift
//  New York Times App
//
//  Created by Aamir Baig on 3/26/19.
//  Copyright © 2019 Aamir Baig. All rights reserved.
//

import Foundation

struct Media {
    
    var type: String
    var caption: String?
    var copyright: String?
    var metaData: [MetaData]
    
    struct MetaData {
        
        var urlStr: String
        var format: String
        var width: Float!
        var height: Float!
        
        init(urlStr: String, format: String) {
            
            self.urlStr = urlStr
            self.format = format
        }
    }
    
    init(type: String, metaData: [MetaData]) {
        
        self.type = type
        self.metaData = metaData
    }
}

