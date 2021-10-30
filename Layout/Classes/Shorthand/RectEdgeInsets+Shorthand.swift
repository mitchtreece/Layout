//
//  RectEdgeInsets+Shorthand.swift
//  Layout-Swift
//
//  Created by Mitch Treece on 7/17/20.
//

import Foundation

public extension RectEdgeInsets {
    
    // Zero
    
    static var z: RectEdgeInsets {
        return .zero
    }
    
    // Edges
    
    static func t(_ value: CGFloat) -> RectEdgeInsets {
        return .top(value)
    }
    
    static func l(_ value: CGFloat) -> RectEdgeInsets {
        return .left(value)
    }
    
    static func b(_ value: CGFloat) -> RectEdgeInsets {
        return .bottom(value)
    }
    
    static func r(_ value: CGFloat) -> RectEdgeInsets {
        return .right(value)
    }
    
    // Horizontal
    
    public static func x(_ left: CGFloat, _ right: CGFloat) -> RectEdgeInsets {
        return .horizontal(left, right)
    }
    
    // Vertical
    
    public static func y(_ top: CGFloat, _ bottom: CGFloat) -> RectEdgeInsets {
        return .vertical(top, bottom)
    }
    
}
