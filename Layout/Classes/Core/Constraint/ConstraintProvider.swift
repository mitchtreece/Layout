//
//  ConstraintProvider.swift
//  Layout
//
//  Created by Mitch Treece on 7/11/20.
//

import Foundation

public protocol ConstraintProvider {
    
    func constraint(equalTo provider: ConstraintProvider, multiplier: CGFloat, constant: CGFloat) throws -> NSLayoutConstraint
    func constraint(greaterThanOrEqualTo provider: ConstraintProvider, multiplier: CGFloat, constant: CGFloat) throws -> NSLayoutConstraint
    func constraint(lessThanOrEqualTo provider: ConstraintProvider, multiplier: CGFloat, constant: CGFloat) throws -> NSLayoutConstraint
    
    func constraint(equalTo constant: CGFloat) throws -> NSLayoutConstraint
    func constraint(greaterThanOrEqualTo constant: CGFloat) throws -> NSLayoutConstraint
    func constraint(lessThanOrEqualTo constant: CGFloat) throws -> NSLayoutConstraint

}

public extension ConstraintProvider {
    
    func constraint(equalTo provider: ConstraintProvider,
                    multiplier: CGFloat,
                    constant: CGFloat) throws -> NSLayoutConstraint { throw ScrewdriverError.notImplemented }
    
    func constraint(greaterThanOrEqualTo provider: ConstraintProvider,
                    multiplier: CGFloat,
                    constant: CGFloat) throws -> NSLayoutConstraint { throw ScrewdriverError.notImplemented }
    
    func constraint(lessThanOrEqualTo provider: ConstraintProvider,
                    multiplier: CGFloat,
                    constant: CGFloat) throws -> NSLayoutConstraint { throw ScrewdriverError.notImplemented }
    
    func constraint(equalTo constant: CGFloat) throws -> NSLayoutConstraint { throw ScrewdriverError.notImplemented }
    func constraint(greaterThanOrEqualTo constant: CGFloat) throws -> NSLayoutConstraint { throw ScrewdriverError.notImplemented }
    func constraint(lessThanOrEqualTo constant: CGFloat) throws -> NSLayoutConstraint { throw ScrewdriverError.notImplemented }
    
}

extension NSLayoutXAxisAnchor: ConstraintProvider {

    public func constraint(equalTo provider: ConstraintProvider,
                           multiplier: CGFloat,
                           constant: CGFloat) throws -> NSLayoutConstraint {
        
        guard let anchor = provider as? NSLayoutXAxisAnchor else { throw ScrewdriverError.invalidLayoutAnchor }
        return constraint(equalTo: anchor, constant: constant)
        
    }
    
    public func constraint(greaterThanOrEqualTo provider: ConstraintProvider,
                           multiplier: CGFloat,
                           constant: CGFloat) throws -> NSLayoutConstraint {
        
        guard let anchor = provider as? NSLayoutXAxisAnchor else { throw ScrewdriverError.invalidLayoutAnchor }
        return constraint(greaterThanOrEqualTo: anchor, constant: constant)
        
    }
    
    public func constraint(lessThanOrEqualTo provider: ConstraintProvider,
                           multiplier: CGFloat,
                           constant: CGFloat) throws -> NSLayoutConstraint {
        
        guard let anchor = provider as? NSLayoutXAxisAnchor else { throw ScrewdriverError.invalidLayoutAnchor }
        return constraint(lessThanOrEqualTo: anchor, constant: constant)
        
    }
    
}

extension NSLayoutYAxisAnchor: ConstraintProvider {
    
    public func constraint(equalTo provider: ConstraintProvider,
                           multiplier: CGFloat,
                           constant: CGFloat) throws -> NSLayoutConstraint {
        
        guard let anchor = provider as? NSLayoutYAxisAnchor else { throw ScrewdriverError.invalidLayoutAnchor }
        return constraint(equalTo: anchor, constant: constant)
        
    }
    
    public func constraint(greaterThanOrEqualTo provider: ConstraintProvider,
                           multiplier: CGFloat,
                           constant: CGFloat) throws -> NSLayoutConstraint {
        
        guard let anchor = provider as? NSLayoutYAxisAnchor else { throw ScrewdriverError.invalidLayoutAnchor }
        return constraint(greaterThanOrEqualTo: anchor, constant: constant)
        
    }
    
    public func constraint(lessThanOrEqualTo provider: ConstraintProvider,
                           multiplier: CGFloat,
                           constant: CGFloat) throws -> NSLayoutConstraint {
        
        guard let anchor = provider as? NSLayoutYAxisAnchor else { throw ScrewdriverError.invalidLayoutAnchor }
        return constraint(lessThanOrEqualTo: anchor, constant: constant)
        
    }
    
}

extension NSLayoutDimension: ConstraintProvider {
    
    public func constraint(equalTo provider: ConstraintProvider,
                           multiplier: CGFloat,
                           constant: CGFloat) throws -> NSLayoutConstraint {
        
        guard let anchor = provider as? NSLayoutDimension else { throw ScrewdriverError.invalidLayoutAnchor }
        return constraint(equalTo: anchor, constant: constant)
        
    }
    
    public func constraint(greaterThanOrEqualTo provider: ConstraintProvider,
                           multiplier: CGFloat,
                           constant: CGFloat) throws -> NSLayoutConstraint {
        
        guard let anchor = provider as? NSLayoutDimension else { throw ScrewdriverError.invalidLayoutAnchor }
        return constraint(greaterThanOrEqualTo: anchor, constant: constant)
        
    }
    
    public func constraint(lessThanOrEqualTo provider: ConstraintProvider,
                           multiplier: CGFloat,
                           constant: CGFloat) throws -> NSLayoutConstraint {
        
        guard let anchor = provider as? NSLayoutDimension else { throw ScrewdriverError.invalidLayoutAnchor }
        return constraint(lessThanOrEqualTo: anchor, constant: constant)
        
    }
    
    public func constraint(equalTo constant: CGFloat) throws -> NSLayoutConstraint {
        return constraint(equalToConstant: constant)
    }
    
    public func constraint(greaterThanOrEqualTo constant: CGFloat) throws -> NSLayoutConstraint {
        return constraint(greaterThanOrEqualToConstant: constant)
    }
    
    public func constraint(lessThanOrEqualTo constant: CGFloat) throws -> NSLayoutConstraint {
        return constraint(lessThanOrEqualToConstant: constant)
    }
    
}
