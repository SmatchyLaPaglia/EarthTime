//
//  SizeCalculator Extension.swift
//  EarthTime
//
//  Created by Jesse Wonder Clark on 9/11/23.
//

import SwiftUI

struct SizeCalculator: ViewModifier {
    
    @Binding var size: CGSize
    
    func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { proxy in
                    Color.clear //  just want  reader to get triggered, so use an empty color
                        .onChange(of: proxy.size) { newValue in
                            size = proxy.size
                        }
                }
            )
    }
}

extension View {
    func saveSize(in size: Binding<CGSize>) -> some View {
        modifier(SizeCalculator(size: size))
    }
}
