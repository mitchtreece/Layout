//
//  EdgeInsets.swift
//  Layout
//
//  Created by Mitch Treece on 7/14/20.
//

import Foundation

public struct EdgeInsets {
    
    public var top: CGFloat
    public var left: CGFloat
    public var bottom: CGFloat
    public var right: CGFloat
        
    public init(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) {
        
        self.top = top
        self.left = left
        self.bottom = bottom
        self.right = right
        
    }
    
    // Zero
    
    public static var zero: EdgeInsets {
        
        return EdgeInsets(
            top: 0,
            left: 0,
            bottom: 0,
            right: 0
        )
        
    }
    
    // Edges
    
    public static func top(_ value: CGFloat) -> EdgeInsets {
        return EdgeInsets(top: value, left: 0, bottom: 0, right: 0)
    }
    
    public static func left(_ value: CGFloat) -> EdgeInsets {
        return EdgeInsets(top: 0, left: value, bottom: 0, right: 0)
    }
    
    public static func bottom(_ value: CGFloat) -> EdgeInsets {
        return EdgeInsets(top: 0, left: 0, bottom: value, right: 0)
    }
    
    public static func right(_ value: CGFloat) -> EdgeInsets {
        return EdgeInsets(top: 0, left: 0, bottom: 0, right: value)
    }
    
    // Horizontal
    
    public static func horizontal(_ left: CGFloat, _ right: CGFloat) -> EdgeInsets {
        return EdgeInsets(top: 0, left: left, bottom: 0, right: right)
    }
    
    public static func h(_ left: CGFloat, _ right: CGFloat) -> EdgeInsets {
        return horizontal(left, right)
    }
    
    public static func x(_ left: CGFloat, _ right: CGFloat) -> EdgeInsets {
        return horizontal(left, right)
    }
    
    // Vertical
    
    public static func vertical(_ top: CGFloat, _ bottom: CGFloat) -> EdgeInsets {
        return EdgeInsets(top: top, left: 0, bottom: bottom, right: 0)
    }
    
    public static func v(_ top: CGFloat, _ bottom: CGFloat) -> EdgeInsets {
        return vertical(top, bottom)
    }
    
    public static func y(_ top: CGFloat, _ bottom: CGFloat) -> EdgeInsets {
        return vertical(top, bottom)
    }
    
    // Helpers
    
    public static func all(_ value: CGFloat, adaptive: Bool = true) -> EdgeInsets {
        
        return EdgeInsets(
            top: value,
            left: value,
            bottom: adaptive ? -value : value,
            right: adaptive ? -value : value
        )
        
    }
    
    public static func allExceptTop(_ value: CGFloat, adaptive: Bool = true) -> EdgeInsets {
        
        return EdgeInsets(
            top: 0,
            left: value,
            bottom: adaptive ? -value : value,
            right: adaptive ? -value : value
        )
        
    }
    
    public static func allExceptLeft(_ value: CGFloat, adaptive: Bool = true) -> EdgeInsets {
        
        return EdgeInsets(
            top: value,
            left: 0,
            bottom: adaptive ? -value : value,
            right: adaptive ? -value : value
        )
        
    }
    
    public static func allExceptBottom(_ value: CGFloat, adaptive: Bool = true) -> EdgeInsets {
        
        return EdgeInsets(
            top: value,
            left: value,
            bottom: 0,
            right: adaptive ? -value : value
        )
        
    }
    
    public static func allExceptRight(_ value: CGFloat, adaptive: Bool = true) -> EdgeInsets {
        
        return EdgeInsets(
            top: value,
            left: value,
            bottom: adaptive ? -value : value,
            right: 0
        )
        
    }
    
}
