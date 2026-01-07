//
//  AnimeKitMainViewModel.swift
//  Pagination_SwifUI
//
//  Created by 김경훈 on 1/7/26.
//

import Foundation
import Combine


class AnimeKitMainViewModel: ObservableObject {
   @Published var animes: [Anime] = []
}
