//
//  ArticleTests.swift
//  New York Times AppTests
//
//  Created by FAB on 3/26/19.
//  Copyright © 2019 Aamir Baig. All rights reserved.
//

import XCTest
@testable import New_York_Times_App

class ArticleTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testArticle() {
        
        let articleId = 1
        let articleTitle = "Test"
        let articlePublishedDate = "26/03/2019"
        let article = Article.init(_id: articleId, title: articleTitle, publishedDate: articlePublishedDate)
        
        XCTAssert(article._id == articleId && article.title == articleTitle && article.publishedDate == articlePublishedDate)
    }
}
