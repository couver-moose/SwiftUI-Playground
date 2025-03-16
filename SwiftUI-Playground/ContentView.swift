//
//  ContentView.swift
//  SwiftUI-Playground
//
//  Created by Dario Daßler on 16.03.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("Deine Playgrounds") {
                    NavigationLink("Safari Sheet", destination: SafariSheetView())
                    NavigationLink("QR-Code Generator", destination: QRCodeView())
                }
            }.navigationTitle("🕹️ SwiftUI-Playground")
        }
    }
}

#Preview {
    ContentView()
}
