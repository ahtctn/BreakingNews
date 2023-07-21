//
//  NewsModel.swift
//  BreakingNews
//
//  Created by Ahmet Ali ÇETİN on 21.07.2023.
//
import Foundation

// MARK: - NewsModel
struct NewsModel: Codable {
    let status: String
    let totalResults: Int
    let articles: [ArticleModel]
}

// MARK: - Article
struct ArticleModel: Codable {
    //MARK: BURADA BİR SORUN VAR BUNU ÇÖZ
    //let source: Source
    let author, title, description: String?
    let url: String
    let urlToImage: String?
    //MARK: BURADA BİR SORUN VAR BUNU ÇÖZ
    //let publishedAt: Date
    let content: String?
}

// MARK: - Source
struct SourceModel: Codable {
    let id: JSONNull?
    let name: String
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
