//
//  NetworkServiceError.swift
//  BreakingNews
//
//  Created by Ahmet Ali ÇETİN on 21.07.2023.
//

import Foundation

enum NetworkServiceError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case decodingError( _ error: Error)
}
