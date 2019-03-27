//
//  ArticlesListVC.swift
//  New York Times App
//
//  Created by Aamir Baig on 3/26/19.
//  Copyright © 2019 Aamir Baig. All rights reserved.
//

import UIKit

class ArticlesListVC: UIViewController {
    
    @IBOutlet weak var articlesTableView: UITableView!
    @IBOutlet private weak var loader: UIActivityIndicatorView!
    
    var articlesList = [Article]()
    var articleListPresenter: ArticlesListPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetUp()
        setUpViews()
    }
    
    private func initialSetUp() {
        
        articleListPresenter = ArticlesListPresenter.init(articleListVC: self)
    }
    
    private func setUpViews() {
        
        reloadArticlesList()
    }
    
    private func reloadArticlesList() {
        
        articleListPresenter.fetchArticlesList()
    }
    
    func startLoaderAnimation(_ start: Bool) {
        if start == true {
            loader.startAnimating()
        }else {
            loader.stopAnimating()
        }
    }
    
    func showFailureAlert() {
        
        let alert = UIAlertController(title: "Loading failed", message: "Failed to load articles. Please try again.", preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Try Again", style: .default, handler: { (_) in
            self.reloadArticlesList()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowArticleDetail", let article = sender as? Article{
            let articleDetailVC =  segue.destination as! ArticleDetailVC
            articleDetailVC.article = article
        }
    }
}

extension ArticlesListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return articlesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let articleListCell = tableView.dequeueReusableCell(withIdentifier: "ArticlesListCellID", for: indexPath as IndexPath) as! ArticlesListCell
        let article = articlesList[indexPath.row]
        articleListCell.setArticle(article)
        return articleListCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "ShowArticleDetail", sender: articlesList[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
}
