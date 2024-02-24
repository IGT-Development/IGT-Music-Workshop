//
//  ProfileMusicElements.swift
//  IGT Music Workshop
//
//  Created by Андрей Чередник on 24.02.2024.
//

import Foundation
import SwiftUI

struct ProfileMusicElements: View {
    
    @State private var items: [MediaItem] = [
        MediaItem(id: UUID(), title: "Жанры", icon: "music.note.list"),
        MediaItem(id: UUID(), title: "Альбомы", icon: "rectangle.stack.fill"),
        MediaItem(id: UUID(), title: "Артисты", icon: "person.2.fill"),
        MediaItem(id: UUID(), title: "Загрузки", icon: "square.and.arrow.down.fill"),
        MediaItem(id: UUID(), title: "Плейлисты", icon: "music.note.list"),
        MediaItem(id: UUID(), title: "Песни", icon: "music.note")
    ]
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Медиатека")
                .font(.title)
                .bold()
                .padding(.leading, 16)
            ForEach(items) { item in
                NavigationLink(destination: Text(item.title)) {
                    HStack {
                        Image(systemName: item.icon)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .padding(8)
                        HStack {
                            Text(item.title)
                                .font(.title3)
                                .foregroundStyle(.white)
                            Spacer()
                            Image(systemName: "chevron.forward")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 12, height: 12)
                                .padding(20)
                                .foregroundStyle(.white.opacity(0.6))
                        }
                        .overlay(
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(.white.opacity(0.6)), alignment: .bottom
                        )
                        .frame(height: 24)
                    }
                    .padding(.leading, 16)
                }
            }
        }
    }
}
