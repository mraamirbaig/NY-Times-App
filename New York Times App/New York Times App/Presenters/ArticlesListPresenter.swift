//
//  ArticlesListPresenter.swift
//  New York Times App
//
//  Created by Aamir Baig on 3/26/19.
//  Copyright © 2019 Aamir Baig. All rights reserved.
//

import Foundation

class ArticlesListPresenter {
    
    let articleListVC: ArticlesListVC!
    
    init(articleListVC: ArticlesListVC) {
        
        self.articleListVC = articleListVC
    }
    
    func fetchArticlesList() {
        
        articleListVC.startLoaderAnimation(true)
        let articleListInteractor = ArticleListInteractor()
        let urlStr = articleListInteractor.getUrlStrForMostPopularArticlesOfPeriod(1)
        ArticleListInteractor().getMostPopularArticles(urlStr: urlStr) { (articles) in
            
            DispatchQueue.main.async {
                self.articleListVC.startLoaderAnimation(false)
            }
            guard articles != nil else {
                DispatchQueue.main.async {
                    self.articleListVC.showFailureAlert()
                }
                return
            }
            DispatchQueue.main.async {
                self.reloadArticlesTableView(articles!)
            }
        }
    }
    
    private func reloadArticlesTableView(_ articles: [Article]) {
        
        articleListVC.articlesList = articles
        articleListVC.articlesTableView.reloadData()
    }
}
