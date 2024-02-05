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
            AuroraView()
            TabView {
                NavigationView {
                    FirstView()
                }
                .tabItem {
                    Label("Песни", systemImage: "music.note")
                }
                
                NavigationView {
                    SecondView()
                }
                .tabItem {
                    Label("Главная", systemImage: "house.fill")
                }
                
                NavigationView {
                    ThirdView()
                }
                .tabItem {
                    Label("Альбомы", systemImage: "opticaldisc.fill")
                }
            }
        }
    }
}

struct FirstView: View {
    var body: some View {
            VStack {
                Text("Ваша музыка будет здесь, но чуток попозже :3")
                    .navigationBarTitle("Песни", displayMode: .inline)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(AuroraView())
    }
}

struct SecondView: View {
    var body: some View {
        ZStack {
            Text("Домашний экран еще строится :)")
                .navigationBarTitle("Главная", displayMode: .inline)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(AuroraView())

    }
}

struct ThirdView: View {
    var body: some View {
        ZStack {
            Text("Альбомы уже в пути — не скучайте! ^_^")
                .navigationBarTitle("Альбомы", displayMode: .inline)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(AuroraView())

    }
}
    
    
//#Preview {
//    MainView()
//}
