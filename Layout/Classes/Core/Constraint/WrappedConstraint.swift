//
//  ConstraintWrapper.swift
//  Layout
//
//  Created by Mitch Treece on 7/17/20.
//

import Foundation

public class WrappedConstraint {
    
    private let _constraint: Constraint?
    
    public var constraint: NSLayoutConstraint? {
        return self._constraint?.constraint
    }
    
    public var type: ConstraintType? {
        return self._constraint?.type
    }
    
    public var key: String? {
        return self._constraint?.key
    }
    
    internal init(_ constraint: Constraint?) {
        self._constraint = constraint
    }
    
}

extension WrappedConstraint: ConstraintUpdatable {
    
    @discardableResult
    public func constant(to constant: Constant) -> Self {
        
        guard let constraint = self.constraint else { return self }
        constraint.constant = constant.value
        return self
        
    }
    
    @discardableResult
    public func offset(by offset: Constant) -> Self {
        
        guard let constraint = self.constraint else { return self }
        constraint.constant = (constraint.constant + offset.value)
        return self
        
    }
    
    @discardableResult
    public func inset(by inset: Constant) -> Self {
        
        guard let constraint = self.constraint else { return self }
        constraint.constant = (constraint.constant - inset.value)
        return self
        
    }
    
    @discardableResult
    public func multiplied(by multiplier: Constant) -> Self {
        
        guard let constraint = self.constraint else { return self }
        constraint.constant = (constraint.constant * multiplier.value)
        return self
        
    }
    
    @discardableResult
    public func divided(by divisor: Constant) -> Self {
        
        guard let constraint = self.constraint else { return self }
        constraint.constant = (constraint.constant / divisor.value)
        return self
        
    }
    
    @discardableResult
    public func priority(_ priority: LayoutPriority) -> Self {
        
        guard let constraint = self.constraint else { return self }
        constraint.priority = priority
        return self
        
    }
    
}
