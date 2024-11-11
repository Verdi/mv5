//
//  StreamSources.swift
//  MV5App
//
//  Created by Michael Verdi on 11/10/24.
//  Based on Openimmersive by Anthony Maës
//

import SwiftUI
import RealityKit
import OpenImmersive

/// A list of available video stream sources.
struct StreamSources: View {
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    @Environment(\.dismissWindow) private var dismissWindow
        
    var body: some View {
        VStack {
            
            FilePicker() { stream in
                playVideo(stream)
            }
            
        }
        .padding()
    }
    
    /// Open the immersive player and play the video for the provided stream.
    /// - Parameters:
    ///   - stream: the model describing the stream.
    ///
    /// Opening the immersive player will close the current window containing the StreamSources view.
    func playVideo(_ stream: StreamModel) {
        Task {
            let result = await openImmersiveSpace(value: stream)
            if result == .opened {
                dismissWindow()
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    StreamSources()
}
