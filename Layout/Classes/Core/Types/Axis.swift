//
//  Axis.swift
//  Layout
//
//  Created by Mitch Treece on 7/13/20.
//

import Foundation

public struct Axis: OptionSet {
    
    public let rawValue: Int

    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    public static let horizontal = Axis(rawValue: 1 << 0)
    public static let vertical = Axis(rawValue: 1 << 1)
    public static let all: Axis = [.horizontal, .vertical]
    
}
