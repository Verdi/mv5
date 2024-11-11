//
//  LocalPlay.swift
//  MV5App
//
//  Created by Michael Verdi on 11/11/24.
//

import SwiftUI
import OpenImmersive

/// A button to play a bundled video file.
public struct FilePicker: View {
    /// The callback to execute after a file has been picked.
    var loadStreamAction: (StreamModel) -> Void

    /// Public initializer for visibility.
    /// - Parameters:
    ///   - loadStreamAction: the callback to execute after a file has been picked.
    public init(loadStreamAction: @escaping (StreamModel) -> Void) {
        self.loadStreamAction = loadStreamAction
    }

    public var body: some View {
        Button("Play", systemImage: "play.circle.fill") {
            // Get the URL for the bundled video file
            if let url = Bundle.main.url(forResource: "zine", withExtension: "mov") {
                let stream = StreamModel(
                    title: "Issue 5",
                    details: "Prototype",
                    url: url,
                    isSecurityScoped: false
                )
                loadStreamAction(stream)
            } else {
                print("Error: Could not find bundled video file.")
            }
        }

    }
}

#Preview {
    FilePicker() { _ in
        // nothing
    }
}
