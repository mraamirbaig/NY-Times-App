//
//  ArticleDetailPresenter.swift
//  New York Times App
//
//  Created by Aamir Baig on 3/26/19.
//  Copyright © 2019 Aamir Baig. All rights reserved.
//

import Foundation
import UIKit

class ArticleDetailPresenter {
    
    let articleDetailVC: ArticleDetailVC!
    
    init(articleDetailVC: ArticleDetailVC) {
        
        self.articleDetailVC = articleDetailVC
    }
    
    func setUpViewWithArticle(_ article: Article) {
        
        articleDetailVC.titleLbl.text = article.title
        articleDetailVC.byLineLbl.text = article.byLine
        articleDetailVC.dateLbl.text = article.publishedDate
        if article.url != nil {
            articleDetailVC.linkButton.setTitle(article.url, for: .normal)
        }
        if let media = article.media  {
            setUpViewWithMedia(media)
        }
    }
    
    private func setUpViewWithMedia(_ media: [Media]) {
        
        if let imageMedia = media.filter({$0.type == "image"}).first {
            articleDetailVC.photoCaptionLbl.text = imageMedia.caption
            articleDetailVC.photoCopyRightsLbl.text = imageMedia.copyright
            
            var photoUrlStr = ""
            if let squarePhotoMetaData = imageMedia.metaData.filter({$0.format == "square320"}).first {
                photoUrlStr = squarePhotoMetaData.urlStr
            }else {
                for metaData in imageMedia.metaData {
                    if metaData.urlStr.isEmpty == false {
                        photoUrlStr = metaData.urlStr
                    }
                }
            }
            setPhoto(photoUrlStr)
        }
    }
    
    private func setPhoto(_ photoUrlStr: String) {
        articleDetailVC.startLoaderAnimation(true)
        DispatchQueue.global(qos: .background).async {
            do {
                let data = try Data.init(contentsOf: URL.init(string:photoUrlStr)!)
                DispatchQueue.main.async {
                    self.articleDetailVC.startLoaderAnimation(false)
                    self.articleDetailVC.photoImgView.image = UIImage(data: data)
                }
            }
            catch {
                DispatchQueue.main.async {
                    self.articleDetailVC.startLoaderAnimation(false)
                }
            }
        }
    }
}
