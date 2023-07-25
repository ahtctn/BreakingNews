//
//  Contants.swift
//  BreakingNews
//
//  Created by Ahmet Ali ÇETİN on 21.07.2023.
//

import Foundation

enum Constants {
    static let baseURL: String = "https://newsapi.org"
    static let API_KEY: String = "a1bda5682f6d4ad390961ef9a1dff965"
    
    static let pathGetTopHeadlines: String = "/v2/top-headlines"
    static let pathGetEverything: String = "/v2/everything"
    
    //MARK: TABLE VIEW
    static let cellID: String = "TableViewCellID"
    
    
    enum Countries {
        static let usa = "us"
        static let turkey = "tr"
        static let netherlands = "nl"
        static let germany = "de"
        static let russia = "ru"
    }
    
    enum Categories {
        static let general = "general"
        static let business = "business"
        static let entertainment = "entertainment"
        static let sports = "sports"
        static let health = "health"
        static let science = "science"
        static let technology = "technology"
    }
    
    static let optionalImageUrl = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4C9uK0aKifAP_AzqJ751RA5_7utMqagTz1A&usqp=CAU"
    
    enum Flags {
        static let usaFlag: String = "https://upload.wikimedia.org/wikipedia/en/thumb/a/a4/Flag_of_the_United_States.svg/1280px-Flag_of_the_United_States.svg.png"
        static let trFlag: String = "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Flag_of_Turkey.svg/2560px-Flag_of_Turkey.svg.png"
        static let nlFlag: String = "https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Flag_of_the_Netherlands.svg/2560px-Flag_of_the_Netherlands.svg.png"
        static let deFlag: String = "https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Flag_of_Germany.svg/2560px-Flag_of_Germany.svg.png"
        static let ruFlag: String = "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/Flag_of_Russia.svg/800px-Flag_of_Russia.svg.png?20120812011549"
    }
    
}



//https://newsapi.org/v2/top-headlines?country=tr&apiKey=a1bda5682f6d4ad390961ef9a1dff965
