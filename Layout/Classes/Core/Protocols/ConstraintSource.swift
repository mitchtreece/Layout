//
//  ConstraintSource.swift
//  Layout
//
//  Created by Mitch Treece on 7/11/20.
//

import Foundation

public protocol ConstraintSource {}

public protocol AxisAnchorConstraintSource: ConstraintSource {
    
    func anchorConstraint(equalTo source: ConstraintSource,
                          constant: CGFloat) throws -> LayoutConstraint
    
    func anchorConstraint(greaterThanOrEqualTo source: ConstraintSource,
                          constant: CGFloat) throws -> LayoutConstraint
    
    func anchorConstraint(lessThanOrEqualTo source: ConstraintSource,
                          constant: CGFloat) throws -> LayoutConstraint
    
}

public protocol DimensionAnchorConstraintSource: ConstraintSource {
    
    func anchorConstraint(equalTo source: ConstraintSource,
                          multiplier: CGFloat,
                          constant: CGFloat) throws -> LayoutConstraint
    
    func anchorConstraint(greaterThanOrEqualTo source: ConstraintSource,
                          multiplier: CGFloat,
                          constant: CGFloat) throws -> LayoutConstraint
    
    func anchorConstraint(lessThanOrEqualTo source: ConstraintSource,
                          multiplier: CGFloat,
                          constant: CGFloat) throws -> LayoutConstraint
    
    func anchorConstraint(equalTo constant: CGFloat) throws -> LayoutConstraint
    func anchorConstraint(greaterThanOrEqualTo constant: CGFloat) throws -> LayoutConstraint
    func anchorConstraint(lessThanOrEqualTo constant: CGFloat) throws -> LayoutConstraint
    
}

public protocol LayoutGuideConstraintSource: ConstraintSource {

    func guideConstraint(_ type: Constraint.ConstraintType,
                         equalTo source: ConstraintSource,
                         multiplier: CGFloat?,
                         constant: CGFloat) throws -> LayoutConstraint

//    func guideConstraint(_ type: Constraint.ConstraintType,
//                         greaterThanOrEqualTo source: ConstraintSource,
//                         multiplier: CGFloat,
//                         constant: CGFloat) throws -> LayoutConstraint
//
//    func guideConstraint(_ type: Constraint.ConstraintType,
//                         lessThanOrEqualTo source: ConstraintSource,
//                         multiplier: CGFloat,
//                         constant: CGFloat) throws -> LayoutConstraint
//
//    func guideConstraint(_ type: Constraint.ConstraintType, equalTo constant: CGFloat) throws -> LayoutConstraint
//    func guideConstraint(_ type: Constraint.ConstraintType, greaterThanOrEqualTo constant: CGFloat) throws -> LayoutConstraint
//    func guideConstraint(_ type: Constraint.ConstraintType, lessThanOrEqualTo constant: CGFloat) throws -> LayoutConstraint

}

extension LayoutAxisAnchorX: AxisAnchorConstraintSource {

    public func anchorConstraint(equalTo source: ConstraintSource,
                                 constant: CGFloat) throws -> LayoutConstraint {

        guard let anchor = source as? LayoutAxisAnchorX else { throw LayoutError.invalidConstraintSource }

        return constraint(
            equalTo: anchor,
            constant: constant
        )

    }

    public func anchorConstraint(greaterThanOrEqualTo source: ConstraintSource,
                                 constant: CGFloat) throws -> LayoutConstraint {

        guard let anchor = source as? LayoutAxisAnchorX else { throw LayoutError.invalidConstraintSource }

        return constraint(
            greaterThanOrEqualTo: anchor,
            constant: constant
        )

    }

    public func anchorConstraint(lessThanOrEqualTo source: ConstraintSource,
                                 constant: CGFloat) throws -> LayoutConstraint {

        guard let anchor = source as? LayoutAxisAnchorX else { throw LayoutError.invalidConstraintSource }

        return constraint(
            lessThanOrEqualTo: anchor,
            constant: constant
        )

    }

}

extension LayoutAxisAnchorY: AxisAnchorConstraintSource {

    public func anchorConstraint(equalTo source: ConstraintSource,
                                 constant: CGFloat) throws -> LayoutConstraint {

        guard let anchor = source as? LayoutAxisAnchorY else { throw LayoutError.invalidConstraintSource }

        return constraint(
            equalTo: anchor,
            constant: constant
        )

    }

    public func anchorConstraint(greaterThanOrEqualTo source: ConstraintSource,
                                 constant: CGFloat) throws -> LayoutConstraint {

        guard let anchor = source as? LayoutAxisAnchorY else { throw LayoutError.invalidConstraintSource }
        
        return constraint(
            greaterThanOrEqualTo: anchor,
            constant: constant
        )

    }

    public func anchorConstraint(lessThanOrEqualTo source: ConstraintSource,
                                 constant: CGFloat) throws -> LayoutConstraint {

        guard let anchor = source as? LayoutAxisAnchorY else { throw LayoutError.invalidConstraintSource }

        return constraint(
            lessThanOrEqualTo: anchor,
            constant: constant
        )

    }

}

extension LayoutDimensionAnchor: DimensionAnchorConstraintSource {

    public func anchorConstraint(equalTo source: ConstraintSource,
                                 multiplier: CGFloat,
                                 constant: CGFloat) throws -> LayoutConstraint {

        guard let anchor = source as? LayoutDimensionAnchor else { throw LayoutError.invalidConstraintSource }
        
        return constraint(
            equalTo: anchor,
            multiplier: multiplier,
            constant: constant
        )

    }

    public func anchorConstraint(greaterThanOrEqualTo source: ConstraintSource,
                                 multiplier: CGFloat,
                                 constant: CGFloat) throws -> LayoutConstraint {

        guard let anchor = source as? LayoutDimensionAnchor else { throw LayoutError.invalidConstraintSource }

        return constraint(
            equalTo: anchor,
            multiplier: multiplier,
            constant: constant
        )

    }

    public func anchorConstraint(lessThanOrEqualTo source: ConstraintSource,
                                 multiplier: CGFloat,
                                 constant: CGFloat) throws -> LayoutConstraint {

        guard let anchor = source as? LayoutDimensionAnchor else { throw LayoutError.invalidConstraintSource }

        return constraint(
            lessThanOrEqualTo: anchor,
            multiplier: multiplier,
            constant: constant
        )

    }

    public func anchorConstraint(equalTo constant: CGFloat) throws -> LayoutConstraint {
        return constraint(equalToConstant: constant)
    }

    public func anchorConstraint(greaterThanOrEqualTo constant: CGFloat) throws -> LayoutConstraint {
        return constraint(greaterThanOrEqualToConstant: constant)
    }

    public func anchorConstraint(lessThanOrEqualTo constant: CGFloat) throws -> LayoutConstraint {
        return constraint(lessThanOrEqualToConstant: constant)
    }

}

extension LayoutGuide: LayoutGuideConstraintSource {

    public func guideConstraint(_ type: Constraint.ConstraintType,
                                equalTo source: ConstraintSource,
                                multiplier: CGFloat?,
                                constant: CGFloat) throws -> LayoutConstraint {
        
        switch type {
        case .horizontal(let hType):
            
            guard let anchor = source as? LayoutAxisAnchorX else {
                throw LayoutError.invalidConstraintSource
            }
            
            switch hType {
            case .left:

                return self.leftAnchor.constraint(
                    equalTo: anchor,
                    constant: constant
                )

            case .right:
                
                return self.rightAnchor.constraint(
                    equalTo: anchor,
                    constant: constant
                )
                
            case .leading:
                
                return self.leadingAnchor.constraint(
                    equalTo: anchor,
                    constant: constant
                )
                
            case .trailing:
                
                return self.trailingAnchor.constraint(
                    equalTo: anchor,
                    constant: constant
                )
                
            case .center:
                
                return self.centerXAnchor.constraint(
                    equalTo: anchor,
                    constant: constant
                )
                
            }

        case .vertical(let vType):
            
            guard let anchor = source as? LayoutAxisAnchorY else {
                throw LayoutError.invalidConstraintSource
            }
            
            switch vType {
            case .top:
                
                return self.topAnchor.constraint(
                    equalTo: anchor,
                    constant: constant
                )
                
            case .bottom:
                
                return self.bottomAnchor.constraint(
                    equalTo: anchor,
                    constant: constant
                )
                
            case .center:
                
                return self.centerYAnchor.constraint(
                    equalTo: anchor,
                    constant: constant
                )
                
            }
            
        case .dimension(let dType):
            
            guard let anchor = source as? LayoutDimensionAnchor else {
                throw LayoutError.invalidConstraintSource
            }
            
            switch dType {
            case .width:
                
                return self.widthAnchor.constraint(
                    equalTo: anchor,
                    multiplier: multiplier ?? 1,
                    constant: constant
                )
                
            case .height:
                
                return self.heightAnchor.constraint(
                    equalTo: anchor,
                    multiplier: multiplier ?? 1,
                    constant: constant
                )
                
            }
            
        }
                
    }

}
