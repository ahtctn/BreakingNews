//
//  ViewController.swift
//  BreakingNews
//
//  Created by Ahmet Ali ÇETİN on 21.07.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //getEverything()
        getSomething()
    }

    func getEverything() {
        NetworkManager.shared.getEverything(q: "bitcoin", apiKey: Constants.API_KEY) { results in
            switch results {
            case .success(let news):
                print(news.articles)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getSomething() {
        NetworkManager.shared.getTopHeadlines(country: "fr",category: "business", apiKey: Constants.API_KEY) { results in
            switch results {
            case .success(let news):
                for article in news.articles {
                    print(article)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}

