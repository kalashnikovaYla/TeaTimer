//
//  RoundedCorner.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 28.11.2024.
//

import Foundation
import SwiftUI

struct RoundedCorner: Shape {
   
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
