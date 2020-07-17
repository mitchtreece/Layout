//
//  RectEdge.swift
//  Layout
//
//  Created by Mitch Treece on 7/14/20.
//

import Foundation

public struct RectEdge: OptionSet {
    
    public let rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    public static let top = RectEdge(rawValue: 1 << 0)
    public static let t = RectEdge(rawValue: 1 << 0)
    
    public static let bottom = RectEdge(rawValue: 1 << 1)
    public static let b = RectEdge(rawValue: 1 << 1)

    public static let left = RectEdge(rawValue: 1 << 2)
    public static let l = RectEdge(rawValue: 1 << 2)

    public static let right = RectEdge(rawValue: 1 << 3)
    public static let r = RectEdge(rawValue: 1 << 3)

    public static let horizontal: RectEdge = [.left, .right]
    public static let h = RectEdge.horizontal
    public static let x = RectEdge.horizontal
    
    public static let vertical: RectEdge = [.top, .bottom]
    public static let v = RectEdge.vertical
    public static let y = RectEdge.vertical
    
    public static let all: RectEdge = [.top, .bottom, .left, .right]
    public static let allExceptTop: RectEdge = [.bottom, .left, .right]
    public static let allExceptBottom: RectEdge = [.top, .left, .right]
    public static let allExceptLeft: RectEdge = [.top, .bottom, .right]
    public static let allExceptRight: RectEdge = [.top, .bottom, .left]

}
