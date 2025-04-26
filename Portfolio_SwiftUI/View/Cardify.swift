//
//  Cardify.swift
//  Portfolio_SwiftUI
//
//  Created by Javier FO on 4/25/25.
//

import SwiftUI

struct Cardify: ViewModifier, Animatable {
    init(isFaceUp: Bool){
        rotation = isFaceUp ? 0 : 180
    }
    var isFaceUp: Bool {
        rotation < 90
    }
    
    var rotation: Double
    var animatableData: Double {
        get {
            return rotation
        }
        set {
            rotation = newValue
        }
    }
    
    func body(content: Content) -> some View {
        ZStack{
            let base = RoundedRectangle(cornerRadius: 15)
                base.foregroundColor(.white)
                base.strokeBorder(style: StrokeStyle(lineWidth: 5, dash: [10,2]))
                    .background(base.fill(.white))
                    .overlay(content)
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .rotation3DEffect(.degrees(rotation), axis: (x: 0, y: 1, z: 0))
    }
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        modifier(Cardify(isFaceUp: isFaceUp))
    }
}

//PROTOCOLS: code sharing, 
