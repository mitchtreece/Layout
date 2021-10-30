//
//  ConstraintUpdatable.swift
//  Layout
//
//  Created by Mitch Treece on 7/16/20.
//

import Foundation

public protocol ConstraintUpdatable {
    
    func constant(to constant: Constant) -> Self
    func offset(by offset: Constant) -> Self
    func inset(by inset: Constant) -> Self
    func multiplied(by multiplier: Constant) -> Self
    func divided(by divisor: Constant) -> Self
    func priority(_ priority: LayoutPriority) -> Self
    
}
