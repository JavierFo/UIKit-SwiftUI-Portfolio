//
//  Cardify.swift
//  Memorize
//
//  Created by CS193p Instructor on 4/26/23.
//  Copyright Stanford University 2023
//

import SwiftUI

struct Cardify: ViewModifier, Animatable {
    init(isFaceUp: Bool) {
        rotation = isFaceUp ? 0 : 180
    }
    
    var isFaceUp: Bool {
        rotation < 90
    }

    var rotation: Double
    
    var animatableData: Double {
        get { rotation }
        set { rotation = newValue }
    }
    
    func body(content: Content) -> some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: Constants.cornerRadius)
            //base.strokeBorder(lineWidth: Constants.lineWidth)
                //.background(base.fill(.white))
            WavyBorder(
                waveLength: Constants.waveLength,
                amplitude: Constants.amplitude,
                cornerRadius: Constants.cornerRadius
            )
            .stroke(Color.green, lineWidth: Constants.lineWidth)
                .overlay(content)
                .opacity(isFaceUp ? 1 : 0)
//            base.fill()
//                .opacity(isFaceUp ? 0 : 1)
            Group {
                ZStack {
                    base.fill()
                    RotatingSymbolGrid()
                }
            }
            .opacity(isFaceUp ? 0 : 1)
        }
        .rotation3DEffect(.degrees(rotation), axis: (0,1,0))
    }
    
    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 5
        static let waveLength: CGFloat = 16
        static let amplitude: CGFloat = 4
    }
}

struct RotatingSymbolGrid: View {
    @State private var rotation: Double = 0

    var body: some View {
        VStack(spacing: 5) {
            ForEach(0..<2) { _ in
                HStack(spacing: 5) {
                    ForEach(0..<2) { _ in
                        Image(systemName: "snowflake")
                            .foregroundColor(.white)
                            .font(.title)
                            .rotationEffect(.degrees(rotation))
                    }
                }
            }
        }
        .onAppear {
            withAnimation(.linear(duration: 3).repeatForever(autoreverses: false)) {
                rotation = 360
            }
        }
    }
}


extension View {
    func cardify(isFaceUp: Bool) -> some View {
        modifier(Cardify(isFaceUp: isFaceUp))
    }
}
