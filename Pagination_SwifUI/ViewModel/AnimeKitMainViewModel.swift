//
//  AnimeKitMainViewModel.swift
//  Pagination_SwifUI
//
//  Created by 김경훈 on 1/7/26.
//

import Foundation
import Combine

@MainActor
class AnimeKitMainViewModel: ObservableObject {
    @Published var animes: [Anime] = []
    
    func loadAnimes() async {
        guard let url = URL(string: "https://api.jikan.moe/v4/top/anime?page=1") else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if data.isEmpty { return }
            
            let decodedData = try JSONDecoder().decode(JikanMoeResponse.self, from: data)
            animes.append(contentsOf: decodedData.data)
        } catch {
            print(error)
        }
    }
}
