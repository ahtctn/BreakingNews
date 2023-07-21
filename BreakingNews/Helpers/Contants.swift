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
}


//https://newsapi.org/v2/top-headlines?country=tr&apiKey=a1bda5682f6d4ad390961ef9a1dff965
