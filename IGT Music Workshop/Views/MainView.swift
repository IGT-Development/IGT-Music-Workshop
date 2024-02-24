//
//  ContentView.swift
//  IGT Music Workshop
//
//  Created by Андрей Чередник on 14.01.2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack {
            TabView {
                NavigationView {
                    HomeView()
                }
                .tabItem {
                    Label("Главная", systemImage: "house.fill")
                }
                
                NavigationView {
                    SearchView()
                }
                .tabItem {
                    Label("Поиск", systemImage: "magnifyingglass")
                }
                
                NavigationView {
                    ProfileView()
                }
                .tabItem {
                    Label("Профиль", systemImage: "person.crop.circle")
                }
            }
        }
    }
}

struct HomeView: View {
    var body: some View {
        ZStack {
            ScrollView {
                VStack (spacing: 16) {
                    Text("Главная на распаковке :3")
                        .navigationBarTitle("Главная", displayMode: .inline)
                }
                .padding()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(AuroraView())
    }
}

struct SearchView: View {
    var body: some View {
        ZStack {
            ScrollView {
                VStack (spacing: 16) {
                    Text("Потеряли поиск, ищем :)")
                        .navigationBarTitle("Поиск", displayMode: .inline)
                }
                .padding()
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(AuroraView())

    }
}



struct ProfileView: View {
    @State var items: [MediaItem] = [
        MediaItem(id: UUID(), title: "Жанры", icon: "music.note.list"),
        MediaItem(id: UUID(), title: "Альбомы", icon: "rectangle.stack.fill"),
        MediaItem(id: UUID(), title: "Артисты", icon: "person.2.fill"),
        MediaItem(id: UUID(), title: "Загрузки", icon: "square.and.arrow.down.fill"),
        MediaItem(id: UUID(), title: "Плейлисты", icon: "music.note.list"),
        MediaItem(id: UUID(), title: "Песни", icon: "music.note")
    ]
    
    @StateObject var albumStore = AlbumStore()
    
    private var email = "Cherednik_01@bk.ru"
    private var login = "Kayllen_ZzZ"
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack (alignment: .leading) {
                    HStack(spacing: 16) {
                        Image("TestProfileImage")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .scaledToFit()
                            .clipped()
                            .cornerRadius(100)
                        VStack (alignment: .leading) {
                            Text(login)
                                .font(.largeTitle)
                                .bold()
                            Text(email)
                                .foregroundColor(.white.opacity(0.6))
                            Button(action: {
                                
                            }
                            ){
                                Text("Редактировать профиль")
                                    .foregroundColor(.accentColor)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding()
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
        }
        .navigationBarTitle("Профиль", displayMode: .automatic)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(AuroraView())
    }
}


    
    
#Preview {
    ProfileView()
}
