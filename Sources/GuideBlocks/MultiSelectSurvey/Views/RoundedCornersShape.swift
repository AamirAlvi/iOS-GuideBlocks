//
//  RoundedCornersShape.swift
//  GuideBlocks
//
//  Created by Marc Stroebel on 2023/3/31.
//  Copyright © 2024 Contextual.
//

import SwiftUI

struct RoundedCornersShape: Shape {
    let corners: UIRectCorner
    let radius: CGFloat
    let extraHeight : CGFloat
    func path(in rect: CGRect) -> Path {
        let rectExtended = CGRect(x: rect.minX, y: rect.minY, width: rect.width, height: rect.height + extraHeight)
        let path = UIBezierPath(roundedRect: rectExtended,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}


extension Shape {
    func fill<Fill: ShapeStyle, Stroke: ShapeStyle>(_ fillStyle: Fill, strokeBorder strokeStyle: Stroke, lineWidth: CGFloat = 1) -> some View {
        self
            .stroke(strokeStyle, lineWidth: lineWidth)
            .background(self.fill(fillStyle))
    }
}
