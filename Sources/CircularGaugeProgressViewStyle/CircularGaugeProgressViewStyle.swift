//
//  CircularGaugeProgressViewStyle.swift
//  TVOS
//
//  Created by Denis Blondeau on 2020-09-12.
//

import SwiftUI

@available(iOS 14.0, tvOS 14.0, *)
public struct CircularGaugeProgressViewStyle: ProgressViewStyle {
    public init() {
        
    }
    let formatter = NumberFormatter()
    var rotation: Angle {
        Angle(degrees: 270)
    }
    var strokeColor = Color.blue
    var strokeWidth = 20.0


    public func makeBody(configuration: Configuration) -> some View {
        let fractionCompleted = configuration.fractionCompleted ?? 0
        formatter.numberStyle = .percent
        let percentage = formatter.string(from: fractionCompleted as NSNumber) ?? "0%"

        return ZStack {
            Circle()
                .stroke(strokeColor.opacity(0.3), style: StrokeStyle(lineWidth: CGFloat(strokeWidth), lineCap: .round))

            Circle()
                .rotation(rotation)
                .trim(from: 0, to: CGFloat(fractionCompleted))
                .stroke(strokeColor, style: StrokeStyle(lineWidth: CGFloat(strokeWidth), lineCap: .round))

            Text(percentage)
                .font(.system(size: 35, weight: .bold, design: .rounded))
                .foregroundColor(.white)
                .offset(y: -4)
                .animation(nil)
        }
    }
}

struct CircularGaugeProgressViewStyle_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView(value: 0.5)
            .progressViewStyle(CircularGaugeProgressViewStyle())
            .frame(height: 200)
            .padding()
    }
}
