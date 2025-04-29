//
//  CardView.swift
//  Portfolio_SwiftUI
//
//  Created by Javier FO on 4/20/25.
//

import Foundation
import SwiftUI

struct CartitaView: View {
    
    var image: String
    var category: String
    var heading: String
    var author: String
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            HStack{
                VStack(alignment: .leading) {
                    Text(category)
                        .font(.headline)
                        .foregroundColor(.secondary)
                        .padding(.vertical, 0.25)
                    Text(heading)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                        .padding(.vertical, 0.5)
                        .minimumScaleFactor(0.5)
                    Text("Written by \(author)".uppercased())
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                Spacer()
            }
            .padding()
        }
        .cornerRadius(10)
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255,opacity: 0.1), lineWidth: 1)
        }
        .padding([.top, .horizontal])
    }
}

struct CartitaView_Previews: PreviewProvider {
    static var previews: some View {
        CartitaView(image: "bunny", category: "SwiftUI Portfolio", heading: "Drawing a Carousel UI with many many many features like wololo and umpalumpa and super wooper duuper", author: "Javier Ferrer")
    }
}


