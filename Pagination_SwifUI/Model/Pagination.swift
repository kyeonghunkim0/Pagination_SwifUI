//
//  Pagination.swift
//  Pagination_SwifUI
//
//  Created by 김경훈 on 1/7/26.
//

import Foundation


struct Pagination: Decodable, Equatable {
    let lastVisiblePage: Int
    let hasNextPage: Bool
    let currentPage: Int
    
    enum CodingKeys: String, CodingKey {
        case lastVisiblePage = "last_visible_page"
        case hasNextPage = "has_next_page"
        case currentPage = "current_page"
    }
}
