//
//  WavyBorder.swift
//  swiftUI_Portfolios
//
//  Created by Javier FO on 4/29/25.
//

import SwiftUI

struct WavyBorder: Shape {
    var waveLength: CGFloat = 20
    var amplitude: CGFloat = 5
    var cornerRadius: CGFloat = 12

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let insetRect = rect.insetBy(dx: 2, dy: 2)

        // Top edge
        var x = insetRect.minX
        while x < insetRect.maxX {
            let midX = x + waveLength / 2
            let endX = min(x + waveLength, insetRect.maxX)
            let actualMidX = (x + endX) / 2
            path.move(to: CGPoint(x: x, y: insetRect.minY))
            path.addQuadCurve(
                to: CGPoint(x: endX, y: insetRect.minY),
                control: CGPoint(x: actualMidX, y: insetRect.minY - amplitude)
            )
            x += waveLength
        }

        // Right edge
        var y = insetRect.minY
        while y < insetRect.maxY {
            let midY = y + waveLength / 2
            let endY = min(y + waveLength, insetRect.maxY)
            let actualMidY = (y + endY) / 2
            path.move(to: CGPoint(x: insetRect.maxX, y: y))
            path.addQuadCurve(
                to: CGPoint(x: insetRect.maxX, y: endY),
                control: CGPoint(x: insetRect.maxX + amplitude, y: actualMidY)
            )
            y += waveLength
        }

        // Bottom edge
        x = insetRect.maxX
        while x > insetRect.minX {
            let midX = x - waveLength / 2
            let endX = max(x - waveLength, insetRect.minX)
            let actualMidX = (x + endX) / 2
            path.move(to: CGPoint(x: x, y: insetRect.maxY))
            path.addQuadCurve(
                to: CGPoint(x: endX, y: insetRect.maxY),
                control: CGPoint(x: actualMidX, y: insetRect.maxY + amplitude)
            )
            x -= waveLength
        }

        // Left edge
        y = insetRect.maxY
        while y > insetRect.minY {
            let midY = y - waveLength / 2
            let endY = max(y - waveLength, insetRect.minY)
            let actualMidY = (y + endY) / 2
            path.move(to: CGPoint(x: insetRect.minX, y: y))
            path.addQuadCurve(
                to: CGPoint(x: insetRect.minX, y: endY),
                control: CGPoint(x: insetRect.minX - amplitude, y: actualMidY)
            )
            y -= waveLength
        }

        return path
    }
}

