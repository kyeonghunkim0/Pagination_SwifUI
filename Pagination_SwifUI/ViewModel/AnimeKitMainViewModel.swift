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
    
    var page: Int = 1
    var lastVisiblePage: Int = -1
    
    func loadAnimes() async {
        guard let url = URL(string: "https://api.jikan.moe/v4/top/anime?page=\(page)") else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if data.isEmpty { return }
            
            let decodedData = try JSONDecoder().decode(JikanMoeResponse.self, from: data)
            
            lastVisiblePage = decodedData.pagination.lastVisiblePage // 데이터의 마지막 페이지를 할당
            animes.append(contentsOf: decodedData.data)
            
            page += 1 // 함수가 다시 실행될 때 다음 페이지를 렌더링할 수 있도록 페이지를 증가
        } catch {
            print(error)
        }
    }
    
    /// 렌더링된 요소의 ID를 기준으로 사용자가 목록의 끝에 도달했는지 확인하는 함수
    func shouldLoadPagination(id: Int) async {
        // 배열의 마지막 id를 확인하고 page 특정 요소에 도달 여부 확인
        if animes.last?.id == id && lastVisiblePage >= page {
            await loadAnimes()
        }
    }
    
    /// 새로고침
    func refresh () async {
        page = 1
        lastVisiblePage = -1
        animes.removeAll()
        
        await loadAnimes()
    }
}
