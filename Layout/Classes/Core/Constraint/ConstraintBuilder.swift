//
//  ConstraintBuilder.swift
//  Layout
//
//  Created by Mitch Treece on 7/11/20.
//

import Foundation

internal class ConstraintBuilder {
    
    @discardableResult
    static func addConstraint(from provider: ConstraintProvider,
                              type: ConstraintType,
                              to target: ConstraintTarget,
                              relation: LayoutRelation,
                              offset: CGFloat) throws -> NSLayoutConstraint {
                
        if let constant = target as? Constant {
        
            switch relation {
            case .equal: return try provider.constraint(equalTo: constant.value)
            case .greaterThanOrEqual: return try provider.constraint(greaterThanOrEqualTo: constant.value)
            case .lessThanOrEqual: return try provider.constraint(lessThanOrEqualTo: constant.value)
            }
        
        }
        
        let targetProvider = try self.targetProvider(
            source: provider,
            constraint: type,
            target: target
        )
                
        switch relation {
        case .equal:
            
            return try provider.constraint(
                equalTo: targetProvider,
                multiplier: 1,
                constant: offset
            )
            
        case .greaterThanOrEqual:
            
            return try provider.constraint(
                greaterThanOrEqualTo: targetProvider,
                multiplier: 1,
                constant: offset
            )
            
        case .lessThanOrEqual:
            
            return try provider.constraint(
                lessThanOrEqualTo: targetProvider,
                multiplier: 1,
                constant: offset
            )
            
        }
                
    }
    
    private static func targetProvider(source: ConstraintProvider,
                                       constraint: ConstraintType,
                                       target: ConstraintTarget) throws -> ConstraintProvider {
        
        var targetProvider: ConstraintProvider?
        
        if let provider = target as? ConstraintProvider {
            targetProvider = provider
        }
        else if let layoutable = target as? Layoutable {
            
            switch constraint {
            case .horizontal(let type):
                
                switch type {
                case .left: targetProvider = layoutable.leftAnchor
                case .leading: targetProvider = layoutable.leadingAnchor
                case .right: targetProvider = layoutable.rightAnchor
                case .trailing: targetProvider = layoutable.trailingAnchor
                case .center: targetProvider = layoutable.centerXAnchor
                }
                
            case .vertical(let type):
                
                switch type {
                case .top: targetProvider = layoutable.topAnchor
                case .bottom: targetProvider  = layoutable.bottomAnchor
                case .center: targetProvider = layoutable.centerYAnchor
                }
                
            case .dimension(let type):
                
                switch type {
                case .width: targetProvider = layoutable.widthAnchor
                case .height: targetProvider = layoutable.heightAnchor
                }
                
            }
            
        }
        else if let _ = target as? Constant {
            throw ScrewdriverError.invalidConstraintTarget
        }
        
        guard let provider = targetProvider else {
            throw ScrewdriverError.invalidConstraintProvider
        }
        
        return provider
        
    }
    
}
