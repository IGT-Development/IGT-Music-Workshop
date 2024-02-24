//
//  AlbumData.swift
//  IGT Music Workshop
//
//  Created by Андрей Чередник on 24.02.2024.
//

import Foundation

protocol AlbumRepository {
    func getAlbums(userId: Int, completion: @escaping ([Album]) -> Void)
}

class LocalAlbumRepository: AlbumRepository {
    private var userAlbums: [Int: [Album]] = [:]
    
    init() {
        // Данные для тестирования
        userAlbums[1] = [
            Album(id: 1, cover: "Cover1", title: "My first love", artist: "Linda"),
            Album(id: 2, cover: "Cover2", title: "The heartbrake", artist: "Luis"),
            Album(id: 3, cover: "Cover3", title: "IGT Music", artist: "Gdeperry")
        ]
    }
    
    func getAlbums(userId: Int, completion: @escaping ([Album]) -> Void) {
        if let albums = userAlbums[userId] {
            completion(albums)
        } else {
            completion([])
        }
    }
}

//class RemoteAlbumRepository: AlbumRepository {
//    func getAlbums(completion: @escaping ([Album]) -> Void) {
//        // Логика для загрузки данных с сервера
//    }
//}

class AlbumStore: ObservableObject {
    @Published var albums: [Album] = []
    private var albumRepository: AlbumRepository
    private let userId: Int
    
    init(userId: Int, albumRepository: AlbumRepository) {
        self.userId = userId
        self.albumRepository = albumRepository
        fetchAlbums()
    }
    
    func fetchAlbums() {
        albumRepository.getAlbums(userId: userId) { albums in
            DispatchQueue.main.async {
                self.albums = albums
            }
        }
    }
}
