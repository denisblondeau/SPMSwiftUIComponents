//
//  GaugeProgressViewStyle.swift
//  TVOS
//
//  Created by Denis Blondeau on 2020-09-12.
//

import SwiftUI

@available(iOS 14.0, tvOS 14.0, *)
public struct GaugeProgressViewStyle: ProgressViewStyle {
    public init() {

    }
    let formatter = NumberFormatter()
    var rotation: Angle {
        Angle(radians: .pi * (1 - trimAmount)) + Angle(radians: .pi / 2)
    }
    var strokeColor = Color.blue
    var strokeWidth = 25.0
    var trimAmount = 0.7


    public func makeBody(configuration: Configuration) -> some View {
        let fractionCompleted = configuration.fractionCompleted ?? 0
        formatter.numberStyle = .percent
        let percentage = formatter.string(from: fractionCompleted as NSNumber) ?? "0%"

        return ZStack {
            Circle()
                .rotation(rotation)
                .trim(from: 0, to: CGFloat(trimAmount))
                .stroke(strokeColor.opacity(0.5), style: StrokeStyle(lineWidth: CGFloat(strokeWidth), lineCap: .round))

            Circle()
                .rotation(rotation)
                .trim(from: 0, to: CGFloat(trimAmount) * CGFloat(fractionCompleted))
                .stroke(strokeColor, style: StrokeStyle(lineWidth: CGFloat(strokeWidth), lineCap: .round))

            Text(percentage)
                .font(.system(size: 50, weight: .bold, design: .rounded))
                .offset(y: -4)
                .animation(nil)
        }
    }
}
