//
//  Data.swift
//  IGT Music Workshop
//
//  Created by Андрей Чередник on 24.02.2024.
//

import Foundation


struct MediaItem: Identifiable {
    let id: UUID
    var title: String
    var icon: String
}

struct Album {
    let id: Int
    let cover: String
    let title: String
    let artist: String
}

class AlbumStore: ObservableObject {
    @Published var albums: [Album] = []
    
    init() {
        for i in 1...30 {
            albums.append(Album(id: i, cover: "AlbumImage", title: "Album \(i)", artist: "Artist \(i)"))
        }
    }
}
