//
//  JikanMoeResponse.swift
//  Pagination_SwifUI
//
//  Created by 김경훈 on 1/7/26.
//

import Foundation


struct JikanMoeResponse: Decodable, Equatable {
    let pagination: Pagination
    let data: [Anime]
}
