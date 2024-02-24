//
//  ProfileView.swift
//  IGT Music Workshop
//
//  Created by Андрей Чередник on 24.02.2024.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            ScrollView {
                VStack (alignment: .leading) {
                    ProfileTab()
                    ProfileMusicElements()
                    RecentAlbums(userId: 1)
                }
            }
        }
        .navigationBarTitle("Профиль", displayMode: .automatic)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(AuroraView())
    }
}
