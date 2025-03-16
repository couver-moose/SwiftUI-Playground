//
//  QRCodeView.swift
//  SwiftUI-Playground
//
//  Created by Dario Daßler on 16.03.25.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct QRCodeView: View {
    @State private var text: String = "https://swift.org/"
    
    var body: some View {
        Form {
            Section {
                HStack {
                    Spacer()
                    Image(uiImage: generateQRCode(from: text))
                        .interpolation(.none)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                    Spacer()
                }
            }
            
            Section("Dein Text:") {
                TextField("QR-Code-Text", text: $text, prompt: Text("Gebe hier dein QRCode Text ein"))
                    .autocorrectionDisabled()
            }
            
        }
        .navigationTitle("📷 QR-Code Generator")
    }
    
    func generateQRCode(from string: String) -> UIImage {
        let context = CIContext()
        let filter = CIFilter.qrCodeGenerator()
        
        filter.message = Data(string.utf8)
        
        if let outputImage = filter.outputImage,
           let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
            return UIImage(cgImage: cgImage)
        }

        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}

#Preview {
    QRCodeView()
}
