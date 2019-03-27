//
//  MediaTests.swift
//  New York Times AppTests
//
//  Created by FAB on 3/26/19.
//  Copyright © 2019 Aamir Baig. All rights reserved.
//

import XCTest
@testable import New_York_Times_App

class MediaTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMedia() {
        
        let metaDataUrl = "url"
        let format = ".png"
        let metaData = Media.MetaData.init(urlStr: metaDataUrl, format: format)
        
        let mediaType = "Image"
        let media = Media.init(type: mediaType, metaData: [metaData])
        
        XCTAssert(media.type == mediaType && media.metaData.count == 1)
    }
    
    func testMetaData() {
        
        let metaDataUrl = "url"
        let format = ".png"
        
        let metaData = Media.MetaData.init(urlStr: metaDataUrl, format: format)
        XCTAssert(metaData.urlStr == metaDataUrl && metaData.format == format)
    }
}
