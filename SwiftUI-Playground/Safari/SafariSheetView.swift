//
//  SafariSheetView.swift
//  SwiftUI-Playground
//
//  Created by Dario Daßler on 16.03.25.
//

import SwiftUI

struct SafariSheetView: View {
    @State private var showSafari = false
    let url = URL(string: "https://www.apple.com/de")!

    var body: some View {
        VStack {
            Button("Safari öffnen") {
                showSafari = true
            }.buttonStyle(.borderedProminent)
        }
        .navigationTitle("🌐 Safari Sheet")
        .sheet(isPresented: $showSafari) {
            SafariView(url: url)
        }
    }
}

#Preview {
    SafariSheetView()
}
