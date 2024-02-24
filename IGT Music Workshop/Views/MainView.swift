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
