//
//  Constant.swift
//  Layout
//
//  Created by Mitch Treece on 7/14/20.
//

import Foundation

private struct AssociatedKeys {
    static var negated: UInt8 = 0
}

// MARK: Protocol

public protocol Constant: DimensionalConstraintTarget {}

// MARK: Extensions

extension CGFloat: Constant {}
extension Float: Constant {}
extension Double: Constant {}
extension Int: Constant {}

internal extension Constant {
    
    var isNegated: Bool {
        get {
            (objc_getAssociatedObject(self, &AssociatedKeys.negated) as? Bool) ?? false
        }
    }
    
    func negated() -> Self {
        
        objc_setAssociatedObject(
            self, &AssociatedKeys.negated,
            !self.isNegated,
            .OBJC_ASSOCIATION_RETAIN_NONATOMIC
        )
        
        return self
        
    }
    
    var value: CGFloat {
        
        var v: CGFloat = 0
        
        if let cgf = self as? CGFloat {
            v = cgf
        }
        else if let f = self as? Float {
            v = CGFloat(f)
        }
        else if let d = self as? Double {
            v = CGFloat(d)
        }
        else if let i = self as? Int {
            v = CGFloat(i)
        }
        
        return self.isNegated ? -v : v
        
    }
    
}
