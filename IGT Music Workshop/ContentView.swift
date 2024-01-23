//
//  ContentView.swift
//  IGT Music Workshop
//
//  Created by Андрей Чередник on 14.01.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationView {
                FirstView()
            }
            .tabItem {
                Label("Songs", systemImage: "music.note")
            }

            NavigationView {
                SecondView()
            }
            .tabItem {
                Label("Home", systemImage: "house.fill")
            }

            NavigationView {
                ThirdView()
            }
            .tabItem {
                Label("Albums", systemImage: "opticaldisc.fill")
            }
        }
    }
}

struct FirstView: View {
    var body: some View {
        Text("Это первый экран")
            .navigationBarTitle("Первый экран", displayMode: .inline)
    }
}

struct SecondView: View {
    var body: some View {
        Text("Это второй экран")
            .navigationBarTitle("Второй экран", displayMode: .inline)
    }
}

struct ThirdView: View {
    var body: some View {
        Text("Это третий экран")
            .navigationBarTitle("Третий экран", displayMode: .inline)
    }
}
    
    
#Preview {
    ContentView()
}
