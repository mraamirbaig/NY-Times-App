//
//  ArticleListInteractor.swift
//  New York Times App
//
//  Created by Aamir Baig on 3/26/19.
//  Copyright © 2019 Aamir Baig. All rights reserved.
//

import Foundation

class ArticleListInteractor {
    
    func getUrlStrForMostPopularArticlesOfPeriod(_ period: Int) -> String {
        
        return AppConstants.BaseUrls.ARTICLE_BASE_URL+"/mostpopular/v2/mostviewed/all-sections/\(period).json?api-key=\(AppConstants.ARTICLE_API_KEY)"
    }
    func getMostPopularArticles(urlStr: String, completionHandler: @escaping (_ articlesArray: [Article]?) -> Void) {
        
        let urlString = URL(string: urlStr)
        
        if let url = urlString {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard error == nil else {
                    print("Failed to call API")
                    print(error!)
                    completionHandler(nil)
                    return
                }
                guard let responseData = data else {
                    print("Did not receive data")
                    completionHandler(nil)
                    return
                }
                completionHandler(self.handleResponseData(responseData))
            }
            task.resume()
        }
    }
    
    func handleResponseData(_ responseData: Data) -> [Article]? {
        
        var articles:[Article]?
        do {
            guard let jsonData = try JSONSerialization.jsonObject(with: responseData, options: [])
                as? [String: Any] else {
                    print("Error trying to convert data to JSON")
                    return nil
            }
            
            if let status = jsonData["status"] as? String {
                if status == "OK" {
                    if let jsonArray = jsonData["results"] as? [Any] {
                        articles = self.createArticlesListFromJSONArray(jsonArray)
                    }
                }
            }
        } catch  {
            print("error trying to convert data to JSON")
            articles = nil
        }
        return articles
    }
    
    func createArticlesListFromJSONArray(_ jsonArray: [Any]) -> [Article] {
        
        var articles = [Article]()
        
        for json in jsonArray {
            if let articleDict = json as? [String: Any], let articleId = articleDict["id"] as? Int, let title = articleDict["title"] as? String, let publishedDate = articleDict["published_date"] as? String {
                var article = Article.init(_id: articleId, title: title, publishedDate: publishedDate)
                article.byLine = (articleDict["byline"] as! String)
                article.url = articleDict["url"] as? String
                if let mediaJsonArray = articleDict["media"] as? [Any] {
                    if let media = MediaService().createMediaArrayFromJSONArray(mediaJsonArray) {
                        article.media = media
                    }
                }
                articles.append(article)
            }
        }
        return articles
    }
}
