//
//  NewsViewModel.swift
//  BreakingNews
//
//  Created by Ahmet Ali ÇETİN on 22.07.2023.
//

import Foundation

class NewsViewModel {
    var articles: [ArticleModel] = []
    var eventHandler: ((_ event: Event) -> Void)?
    
    func getTopHeadlines() {
        self.eventHandler?(.loading)
        NetworkManager.shared.getTopHeadlines(country: "tr", category: "business", apiKey: Constants.API_KEY) { results in
            switch results {
            case .success(let news):
                self.articles = news.articles
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func numberOfRows() -> Int {
        return self.articles.count
    }
    
    func articleCell(at index: Int) -> ArticleModel {
        return self.articles[index]
    }
}

extension NewsViewModel {
    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(_ error: Error?)
    }
}
