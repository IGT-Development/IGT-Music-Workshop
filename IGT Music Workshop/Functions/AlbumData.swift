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
    // Сохраните альбомы пользователя в локальной переменной
    private var userAlbums: [Int: [Album]] = [:]
    
    init() {
        // Пример данных для тестирования
        userAlbums[1] = [
            Album(id: 1, cover: "cover1", title: "Album 1", artist: "Artist 1"),
            Album(id: 2, cover: "cover2", title: "Album 2", artist: "Artist 2")
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
//        // Например, использование URLSession для выполнения запроса к API сервера
//        // Затем парсинг полученных данных и вызов completion с полученным результатом
//    }
//}

class AlbumStore: ObservableObject {
    @Published var albums: [Album] = []
    var albumRepository: AlbumRepository
    let userId: Int
    
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
