//
//  SnappyHeaderView.swift
//  SwiftUI-Playground
//
//  Created by Dario Daßler on 03.04.25.
//

import SwiftUI

struct SnappyHeaderView: View {

    var body: some View {
            List {
                Section {
                    ForEach(0..<30) { i in
                        Text("Item \(i)")
                            .padding(.vertical, 10)
                    }
                } header: {
                    Text("Snappy Header")
                        .font(.largeTitle.bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 12)
                        .scrollTransition(.animated, axis: .vertical) { view, phase in
                            view
                                .scaleEffect(phase.isIdentity ? 1.0 : 0.7)
                                .opacity(phase.isIdentity ? 1.0 : 0.4)
                        }
                }
                .headerProminence(.increased)
            }
            .listStyle(.plain)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("")
        }
}

#Preview {
    NavigationStack {
        SnappyHeaderView()
    }
}
