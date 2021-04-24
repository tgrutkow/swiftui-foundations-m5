//
//  LearningAppApp.swift
//  LearningApp
//
//  Created by Thomas Grutkowski on 4/24/21.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
              .environmentObject(ContentModel())
        }
    }
}
