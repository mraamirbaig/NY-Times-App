//
//  ArticlesListCell.swift
//  New York Times App
//
//  Created by Aamir Baig on 3/26/19.
//  Copyright © 2019 Aamir Baig. All rights reserved.
//

import UIKit

class ArticlesListCell: UITableViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet private weak var byLineLbl: UILabel!
    @IBOutlet private weak var dateLbl: UILabel!
    
    func setArticle(_ article: Article) {
        
        titleLbl.text = article.title
        byLineLbl.text = article.byLine
        dateLbl.text = article.publishedDate
    }
}
