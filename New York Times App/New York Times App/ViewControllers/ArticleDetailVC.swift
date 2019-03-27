//
//  ArticleDetailVC.swift
//  New York Times App
//
//  Created by Aamir Baig on 3/26/19.
//  Copyright © 2019 Aamir Baig. All rights reserved.
//

import UIKit

class ArticleDetailVC: UIViewController {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var photoCaptionLbl: UILabel!
    @IBOutlet weak var photoCopyRightsLbl: UILabel!
    @IBOutlet weak var byLineLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var photoImgView: UIImageView!
    @IBOutlet private weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var linkButton: UIButton!
    
    var article: Article?
    var articleDetailPresenter: ArticleDetailPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        initialSetUp()
        setUpViews()
    }
    
    private func initialSetUp() {
        
        articleDetailPresenter = ArticleDetailPresenter.init(articleDetailVC: self)
    }
    
    private func setUpViews() {
        
        if article != nil {
            
            articleDetailPresenter.setUpViewWithArticle(article!)
        }
    }
    
    func startLoaderAnimation(_ start: Bool) {
        if start == true {
            loader.startAnimating()
        }else {
            loader.stopAnimating()
        }
    }
    
    @IBAction func linkBtnAction(sender: AnyObject) {
        if article != nil, article!.url != nil {
            if let url = URL.init(string:article!.url!) {
                UIApplication.shared.open(url, options: convertToUIApplicationOpenExternalURLOptionsKeyDictionary([:]), completionHandler: nil)
            }
        }
    }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToUIApplicationOpenExternalURLOptionsKeyDictionary(_ input: [String: Any]) -> [UIApplication.OpenExternalURLOptionsKey: Any] {
	return Dictionary(uniqueKeysWithValues: input.map { key, value in (UIApplication.OpenExternalURLOptionsKey(rawValue: key), value)})
}
