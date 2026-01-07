//
//  Anime.swift
//  Pagination_SwifUI
//
//  Created by 김경훈 on 1/7/26.
//

import Foundation


struct Anime: Identifiable, Decodable, Equatable {
    var id: Int
    let url: String
    let image: AnimeImage
    let title: String
    let episodes: Int?
    let rank: Int?
    let score: Double?
    
    enum CodingKeys: String, CodingKey {
        case id = "mal_id"
        case url = "url"
        case image = "images"
        case title = "title"
        case episodes = "episodes"
        case rank = "rank"
        case score = "score"
    }
    
    static let sampleData = Anime(id: 52991,
                                  url: "https://myanimelist.net/anime/52991/Sousou_no_Frieren",
                                  image: AnimeImage(jpg: ImageDetails(imageUrl:  "https://cdn.myanimelist.net/images/anime/1015/138006.jpg",
                                                                      smallImageUrl: "https://cdn.myanimelist.net/images/anime/1015/138006t.jpg",
                                                                      largeImageUrl: "https://cdn.myanimelist.net/images/anime/1015/138006l.jpg"),
                                                    webp: ImageDetails(imageUrl: "https://cdn.myanimelist.net/images/anime/1015/138006.webp",
                                                                       smallImageUrl: "https://cdn.myanimelist.net/images/anime/1015/138006t.webp",
                                                                       largeImageUrl: "https://cdn.myanimelist.net/images/anime/1015/138006l.webp")),
                                  title: "Sousou no Frieren",
                                  episodes: 28,
                                  rank: 1,
                                  score: 9.12)
}


struct AnimeImage: Decodable, Equatable {
    let jpg: ImageDetails
    let webp: ImageDetails
}


struct ImageDetails: Decodable, Equatable {
    let imageUrl: String
    let smallImageUrl: String
    let largeImageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case imageUrl = "image_url"
        case smallImageUrl = "small_image_url"
        case largeImageUrl = "large_image_url"
    }
}
