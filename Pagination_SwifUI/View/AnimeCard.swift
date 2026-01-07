//
//  AnimeCard.swift
//  Pagination_SwifUI
//
//  Created by 김경훈 on 1/7/26.
//

import SwiftUI

struct AnimeCard: View {
    let anime: Anime
    
    var body: some View {
        VStack(alignment: .leading) {
            // Image
            AsyncImage(url: URL(string: anime.image.jpg.imageUrl)) { image in
                image.resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 230)
            } placeholder: {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .frame(width: 200, height: 200)
            }
            
            // Title
            Text(anime.title)
                .lineLimit(1)
                .padding(.horizontal)
            
            // Score
            Label {
                Text(String(format: "%2.f", anime.score ?? 0))
                    .fontWeight(.light)
            } icon: {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    AnimeCard(anime: Anime.sampleData)
}
