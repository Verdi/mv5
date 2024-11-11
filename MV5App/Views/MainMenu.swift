//
//  MainMenu.swift
//  MV5App
//
//  Created by Michael Verdi on 11/10/24.
//  Based on Openimmersive by Anthony Maës
//

import SwiftUI
import OpenImmersive

/// A simple window menu welcoming users to the app.
struct MainMenu: View {
    /// The visibility of a tooltip with more information about MV-HEVC encoding.
    @State var isTooltipShowing: Bool = false
    
    var body: some View {
        VStack {
            Image("mv-logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 255)
                .padding()
            
            Text("Verdi - Issue 5")
                .font(.largeTitle)
            
            Text("Prototype")
                .font(.subheadline)
            
            StreamSources()
            
            
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    MainMenu()
}
