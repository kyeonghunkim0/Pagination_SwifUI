//
//  AnimeKitMainView.swift
//  Pagination_SwifUI
//
//  Created by 김경훈 on 1/7/26.
//

import SwiftUI

struct AnimeKitMainView: View {
    @StateObject var viewModel = AnimeKitMainViewModel()
    
    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.animes) { anime in
                        AnimeCard(anime: anime)
                            .onAppear {
                                Task {
                                    await viewModel.shouldLoadPagination(id: anime.id)
                                }
                            }
                            .padding(.bottom)
                    }
                }
            }
            .navigationTitle("Top Animes")
            .padding()
        }
        .onAppear {
            Task {
                await viewModel.loadAnimes()
            }
        }
        .refreshable {
            Task {
                await viewModel.refresh()
            }
        }
    }
}

#Preview {
    AnimeKitMainView()
}
