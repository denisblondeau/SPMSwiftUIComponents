//
//  BarProgressViewStyle.swift
//  TVOS
//
//  Created by Denis Blondeau on 2020-09-12.
//

import SwiftUI

@available(iOS 14.0, tvOS 14.0, *)
public struct BarProgressViewStyle: ProgressViewStyle {
    public init() {
        
    }

    var strokeColor = Color.blue

    public func makeBody(configuration: Configuration) -> some View {
        let fractionCompleted = configuration.fractionCompleted ?? 0


        return ZStack(alignment: .leading) {
            GeometryReader { geometry in
                RoundedRectangle(cornerRadius: 45).frame(width: geometry.size.width,
                                                         height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(Color(UIColor.systemTeal))

                RoundedRectangle(cornerRadius: 45).frame(width: min(CGFloat(fractionCompleted) * geometry.size.width,geometry.size.width),
                                                         height: geometry.size.height)
                    .foregroundColor(Color(UIColor.systemBlue))
                    .animation(.linear)
            }

        }

    }
}



struct BarProgressViewStyle_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView(value: 0.5)
            .progressViewStyle(BarProgressViewStyle())
            .frame(height: 15)
            .padding()
    }
}
