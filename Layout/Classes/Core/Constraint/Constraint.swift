//
//  Constraint.swift
//  Layout
//
//  Created by Mitch Treece on 7/15/20.
//

import Foundation

public class Constraint {
    
    public let constraint: NSLayoutConstraint
    public let type: ConstraintType
    public let key: String?
    
    internal init(_ constraint: NSLayoutConstraint,
                  type: ConstraintType,
                  key: String?) {
        
        self.constraint = constraint
        self.type = type
        self.key = key
        
    }
    
    internal func wrapped() -> WrappedConstraint {
        return WrappedConstraint(self)
    }
    
}

extension Constraint: ConstraintUpdatable {
    
    @discardableResult
    public func constant(to constant: Constant) -> Self {
        self.constraint.constant = constant.value
        return self
    }
    
    @discardableResult
    public func offset(by offset: Constant) -> Self {
        self.constraint.constant = (self.constraint.constant + offset.value)
        return self
    }
    
    @discardableResult
    public func inset(by inset: Constant) -> Self {
        self.constraint.constant = (self.constraint.constant - inset.value)
        return self
    }
    
    @discardableResult
    public func multiplied(by multiplier: Constant) -> Self {
        self.constraint.constant = (self.constraint.constant * multiplier.value)
        return self
    }
    
    @discardableResult
    public func divided(by divisor: Constant) -> Self {
        self.constraint.constant = (self.constraint.constant / divisor.value)
        return self
    }
    
    @discardableResult
    public func priority(_ priority: LayoutPriority) -> Self {
        self.constraint.priority = priority
        return self
    }
    
}
