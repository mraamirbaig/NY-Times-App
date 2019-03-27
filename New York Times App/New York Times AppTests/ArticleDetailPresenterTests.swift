//
//  ArticleDetailPresenterTests.swift
//  New York Times AppTests
//
//  Created by FAB on 3/26/19.
//  Copyright © 2019 Aamir Baig. All rights reserved.
//

import XCTest
@testable import New_York_Times_App

class ArticleDetailPresenterTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInit() {
        let articleDetailVC = ArticleDetailVC()
        let articleDetailPresenter:ArticleDetailPresenter? = ArticleDetailPresenter.init(articleDetailVC: articleDetailVC)
        XCTAssert(articleDetailPresenter != nil)
    }
}
