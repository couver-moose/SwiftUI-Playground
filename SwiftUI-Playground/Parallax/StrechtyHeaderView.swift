//
//  Parallax.swift
//  SwiftUI-Playground
//
//  Created by Dario Daßler on 30.03.25.
//

import SwiftUI

struct StretchyHeaderView: View {
    let mountainNames = [
        "Matterhorn – Schweiz",
        "Mont Blanc – Frankreich/Italien",
        "Zugspitze – Deutschland",
        "Großglockner – Österreich",
        "Dolomiten – Italien",
        "Mount Fuji – Japan",
        "Mount Everest – Nepal",
        "Rocky Mountains – USA/Kanada",
        "Table Mountain – Südafrika",
        "Ben Nevis – Schottland",
        "Andes – Südamerika",
        "Himalaya – Asien",
        "Kilimandscharo – Tansania",
        "Mount Rainier – USA",
        "Mount Elbrus – Russland",
        "Jungfrau – Schweiz",
        "Mount Cook – Neuseeland",
        "Tatra – Polen/Slowakei",
        "Sierra Nevada – Spanien",
        "Snowdon – Wales"
    ]

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                let height = 250.0
                GeometryReader { geometry in
                    let offset = geometry.frame(in: .global).minY
                    
                    Image("mountains") // Bild aus Assets
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width)
                        .frame(height: offset > 0 ? height + offset : height)
                        .clipped()
                        .offset(y: -offset)
                }
                .frame(height: height) // Startgröße des Headers
                
                // Inhalt der ScrollView
                VStack(alignment: .leading, spacing: 16) {
                    Text("🙆🏽‍♂️ Parallax Effekt")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    ForEach(mountainNames, id: \.self) { name in
                        Text(name)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(10)
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(Color(.systemBackground))
                )
                .offset(y: -10)
            }
        }
    }
}

#Preview {
    NavigationStack {
        StretchyHeaderView()
    }
}
