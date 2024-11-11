//
//  MV5App.swift
//  MV5App
//
//  Created by Michael Verdi on 11/10/24.
//  Based on Openimmersive by Anthony Maës
//

import SwiftUI
import OpenImmersive

@main
struct MV5App: App {
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    
    var body: some Scene {
        WindowGroup(id: "MainWindow") {
            MainMenu()
        }
        .defaultSize(width: 750, height: 600)
        
        ImmersiveSpace(for: StreamModel.self) { $model in
            ImmersivePlayer(selectedStream: model!) {
                Task {
                    openWindow(id: "MainWindow")
                    await dismissImmersiveSpace()
                }
            }
        }
        .immersionStyle(selection: .constant(.full), in: .full)
    }
}
