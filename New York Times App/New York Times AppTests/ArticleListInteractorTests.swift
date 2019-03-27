//
//  ArticleListInteractorTests.swift
//  New York Times AppTests
//
//  Created by FAB on 3/26/19.
//  Copyright © 2019 Aamir Baig. All rights reserved.
//

import XCTest
@testable import New_York_Times_App

class ArticleListInteractorTests: XCTestCase {
    
    var articleListInteractor: ArticleListInteractor!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        articleListInteractor = ArticleListInteractor()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        articleListInteractor = nil
    }
    
    func testGetMostPopularArticlesOfPeriod() {
        
        let urlStr = articleListInteractor.getUrlStrForMostPopularArticlesOfPeriod(1)
        var articles: [Article]?
        articleListInteractor.getMostPopularArticles(urlStr: urlStr) { (result) in
            articles = result
            XCTAssert(articles != nil)
        }
    }
    
    func testErrorOfGetMostPopularArticlesOfPeriod() {
        
        let urlStr = "12345678"
        var articles: [Article]?
        articleListInteractor.getMostPopularArticles(urlStr: urlStr) { (result) in
            articles = result
        }
        XCTAssert(articles == nil)
    }
    
    func testHandleResponseDataParsingFailure() {
        
        let data:Data = Data.init(count: 1)
        XCTAssert(articleListInteractor.handleResponseData(data) == nil)
    }
}
