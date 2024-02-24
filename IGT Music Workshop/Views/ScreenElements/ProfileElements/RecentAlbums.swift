//
//  RecentAlbums.swift
//  IGT Music Workshop
//
//  Created by Андрей Чередник on 24.02.2024.
//

import Foundation
import SwiftUI

struct RecentAlbums: View {
    
    @StateObject private var albumStore: AlbumStore
    private let userId: Int
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    init(userId: Int) {
        self.userId = userId
        self._albumStore = StateObject(wrappedValue: AlbumStore(userId: userId, albumRepository: LocalAlbumRepository()))
    }
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Недавнее")
                .font(.title)
                .bold()
                .padding(.leading, 16)
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(albumStore.albums, id: \.id) { album in
                    VStack(alignment: .leading) {
                        Image(album.cover)
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                            .clipped()
                            .cornerRadius(8)
                        Text(album.title)
                        Text(album.artist)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .padding(8)
                }
            }
            .padding(.horizontal, 16)
        }
    }
}

