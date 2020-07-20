//
//  ConstraintBuilder.swift
//  Layout
//
//  Created by Mitch Treece on 7/11/20.
//

import Foundation

internal class ConstraintBuilder {
    
    @discardableResult
    static func addConstraint(type: Constraint.ConstraintType,
                              from source: ConstraintSource,
                              to target: ConstraintTarget,
                              relation: LayoutRelation,
                              offset: CGFloat) throws -> LayoutConstraint {
                
        if let constant = target as? Constant {
        
            switch relation {
            case .equal: return try source.constraint(equalTo: constant.value)
            case .greaterThanOrEqual: return try source.constraint(greaterThanOrEqualTo: constant.value)
            case .lessThanOrEqual: return try source.constraint(lessThanOrEqualTo: constant.value)
            }
        
        }
        
        let targetSource = try self.targetConstraintSource(
            type: type,
            target: target
        )
                        
        switch relation {
        case .equal:
            
            return try source.constraint(
                equalTo: targetSource,
                multiplier: 1,
                constant: offset
            )
            
        case .greaterThanOrEqual:
            
            return try source.constraint(
                greaterThanOrEqualTo: targetSource,
                multiplier: 1,
                constant: offset
            )
            
        case .lessThanOrEqual:
            
            return try source.constraint(
                lessThanOrEqualTo: targetSource,
                multiplier: 1,
                constant: offset
            )
            
        }
                
    }
    
    private static func targetConstraintSource(type: Constraint.ConstraintType,
                                               target: ConstraintTarget) throws -> ConstraintSource {
        
        var _source: ConstraintSource?
        
        if let s = target as? ConstraintSource {
            _source = s
        }
        else if let layoutable = target as? Layoutable {
            
            switch type {
            case .horizontal(let hType):
                
                switch hType {
                case .left: _source = layoutable.leftAnchor
                case .leading: _source = layoutable.leadingAnchor
                case .right: _source = layoutable.rightAnchor
                case .trailing: _source = layoutable.trailingAnchor
                case .center: _source = layoutable.centerXAnchor
                }
                
            case .vertical(let vType):
                
                switch vType {
                case .top: _source = layoutable.topAnchor
                case .bottom: _source  = layoutable.bottomAnchor
                case .center: _source = layoutable.centerYAnchor
                }
                
            case .dimension(let dType):
                
                switch dType {
                case .width: _source = layoutable.widthAnchor
                case .height: _source = layoutable.heightAnchor
                }
                
            }
            
        }
        else if let _ = target as? Constant {
            throw LayoutError.invalidConstraintTarget
        }
        
        guard let source = _source else {
            throw LayoutError.invalidConstraintTarget
        }
        
        return source
        
    }
    
}
