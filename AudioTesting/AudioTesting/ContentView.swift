//
//  ContentView.swift
//  AudioTesting
//
//  Created by Vision Solutions on 4/28/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var handler = ViewControllerHandler()

    var body: some View {
        VStack {
            UIKitViewControllerWrapper()
                .environmentObject(handler)
                .edgesIgnoringSafeArea(.all) // Integrates the UIKit view.
            
            Button("Play/Stop") {
                handler.toggleTempo()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
        }
    }
}


#Preview {
    ContentView()
}
