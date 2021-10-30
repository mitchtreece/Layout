//
//  LayoutMaker.swift
//  Layout
//
//  Created by Mitch Treece on 7/13/20.
//

import Foundation

public class LayoutMaker {
    
    internal private(set) weak var layoutable: Layoutable!
    public private(set) var constraints = [Constraint]()
    
    private var superview: View {
        return self.layoutable.superview!
    }
    
    private var safeArea: LayoutGuide {
        return (self.layoutable.superview ?? self.layoutable)!.safeAreaLayoutGuide
    }
    
    internal init(_ layoutable: Layoutable) {
        self.layoutable = layoutable
    }
    
    internal func removeAllConstraints() {
        
        self.constraints.forEach { $0.constraint.isActive = false }
        self.constraints.removeAll()
        
    }
    
    private func caught(_ error: Error,
                        type: Constraint.ConstraintType,
                        source: ConstraintSource,
                        target: ConstraintTarget) {
        
        guard let layoutError = error as? LayoutError else {
            log(error.localizedDescription)
            return
        }
        
        switch layoutError {
        case .invalidConstraintSource: break
        case .invalidConstraintTarget: break
        }
        
        log(error.localizedDescription)
        
    }
        
    private func log(_ message: String) {
        print("📌 <Layout>: \(message)")
    }
        
}

public extension LayoutMaker {
    
    @discardableResult
    private func addConstraint(type: Constraint.ConstraintType,
                               from source: ConstraintSource,
                               to target: ConstraintTarget,
                               relation: LayoutRelation,
                               offset: Constant,
                               priority: LayoutPriority?,
                               key: String?) -> Self {
        
        do {
            
            let constraint = try ConstraintBuilder.addConstraint(
                type: type,
                from: source,
                to: target,
                relation: relation,
                offset: offset.value
            )
            
            if let priority = priority {
                constraint.priority = priority
            }
            
            constraint.isActive = true

            self.constraints.append(Constraint(
                constraint,
                type: type,
                key: key
            ))
            
        }
        catch {
            
            caught(
                error,
                type: type,
                source: source,
                target: target
            )
            
        }
        
        return self
        
    }
 
    // Horizontal
    
    @discardableResult
    func left(_ relation: LayoutRelation = .equal,
              to target: HorizontalConstraintTarget? = nil,
              offset: Constant = 0,
              priority: LayoutPriority? = nil,
              key: String? = nil) -> Self {
        
        return addConstraint(
            type: .horizontal(.left),
            from: self.layoutable.leftAnchor,
            to: target ?? self.superview.leftAnchor,
            relation: relation,
            offset: offset,
            priority: priority,
            key: key
        )
        
    }
    
    @discardableResult
    func leading(_ relation: LayoutRelation = .equal,
                 to target: HorizontalConstraintTarget? = nil,
                 offset: Constant = 0,
                 priority: LayoutPriority? = nil,
                 key: String? = nil) -> Self {
        
        return addConstraint(
            type: .horizontal(.leading),
            from: self.layoutable.leadingAnchor,
            to: target ?? self.superview.leadingAnchor,
            relation: relation,
            offset: offset,
            priority: priority,
            key: key
        )
        
    }
    
    @discardableResult
    func right(_ relation: LayoutRelation = .equal,
               to target: HorizontalConstraintTarget? = nil,
               offset: Constant = 0,
               priority: LayoutPriority? = nil,
               key: String? = nil) -> Self {
        
        return addConstraint(
            type: .horizontal(.right),
            from: self.layoutable.rightAnchor,
            to: target ?? self.superview,
            relation: relation,
            offset: offset,
            priority: priority,
            key: key
        )
        
    }
        
    @discardableResult
    func trailing(_ relation: LayoutRelation = .equal,
                  to target: HorizontalConstraintTarget? = nil,
                  offset: Constant = 0,
                  priority: LayoutPriority? = nil,
                  key: String? = nil) -> Self {
        
        return addConstraint(
            type: .horizontal(.trailing),
            from: self.layoutable.trailingAnchor,
            to: target ?? self.superview.trailingAnchor,
            relation: relation,
            offset: offset,
            priority: priority,
            key: key
        )
        
    }
    
    // Vertical
    
    @discardableResult
    func top(_ relation: LayoutRelation = .equal,
             to target: VerticalConstraintTarget? = nil,
             offset: Constant = 0,
             priority: LayoutPriority? = nil,
             key: String? = nil) -> Self {
        
        return addConstraint(
            type: .vertical(.top),
            from: self.layoutable.topAnchor,
            to: target ?? self.superview.topAnchor,
            relation: relation,
            offset: offset,
            priority: priority,
            key: key
        )
        
    }
    
    @discardableResult
    func bottom(_ relation: LayoutRelation = .equal,
                to target: VerticalConstraintTarget? = nil,
                offset: Constant = 0,
                priority: LayoutPriority? = nil,
                key: String? = nil) -> Self {
        
        return addConstraint(
            type: .vertical(.bottom),
            from: self.layoutable.bottomAnchor,
            to: target ?? self.superview.bottomAnchor,
            relation: relation,
            offset: offset,
            priority: priority,
            key: key
        )
        
    }
    
    // Edges
    
    @discardableResult
    func edges(_ edges: RectEdge = .all,
               relation: LayoutRelation = .equal,
               to target: AxisConstraintTarget? = nil,
               insets: RectEdgeInsets = .zero) -> Self {
        
        let _target = target ?? self.superview
        
        if edges.contains(.top) {
            
            guard let vTarget = _target as? VerticalConstraintTarget else {
                                
                caught(
                    LayoutError.invalidConstraintTarget,
                    type: .vertical(.top),
                    source: self.layoutable.topAnchor,
                    target: _target
                )
                
                return self
                
            }
            
            top(
                relation,
                to: vTarget,
                offset: insets.top
            )
            
        }
        
        if edges.contains(.bottom) {
            
            guard let vTarget = _target as? VerticalConstraintTarget else {
                
                caught(
                    LayoutError.invalidConstraintTarget,
                    type: .vertical(.bottom),
                    source: self.layoutable.bottomAnchor,
                    target: _target
                )
                
                return self
                
            }
            
            bottom(
                relation,
                to: vTarget,
                offset: insets.bottom
            )
            
        }
        
        if edges.contains(.left) {
            
            guard let hTarget = _target as? HorizontalConstraintTarget else {
                
                caught(
                    LayoutError.invalidConstraintTarget,
                    type: .horizontal(.left),
                    source: self.layoutable.leftAnchor,
                    target: _target
                )
                
                return self
                
            }
            
            left(
                relation,
                to: hTarget,
                offset: insets.left
            )
            
        }
        
        if edges.contains(.right) {
            
            guard let hTarget = _target as? HorizontalConstraintTarget else {
                
                caught(
                    LayoutError.invalidConstraintTarget,
                    type: .horizontal(.right),
                    source: self.layoutable.rightAnchor,
                    target: _target
                )
                
                return self
                
            }
            
            right(
                relation,
                to: hTarget,
                offset: insets.right
            )
            
        }
        
        return self
        
    }
    
    // Center
    
    @discardableResult
    func center(_ axis: Axis = .all,
                relation: LayoutRelation = .equal,
                to target: AxisConstraintTarget? = nil,
                offset: Constant = 0) -> Self {
        
        let _target = target ?? self.superview
        
        if axis.contains(.horizontal) {
            
            guard let hTarget = _target as? HorizontalConstraintTarget else{
                
                caught(
                    LayoutError.invalidConstraintTarget,
                    type: .horizontal(.center),
                    source: self.layoutable.centerXAnchor,
                    target: _target
                )
                
                return self
                
            }
            
            addConstraint(
                type: .horizontal(.center),
                from: self.layoutable.centerXAnchor,
                to: hTarget,
                relation: relation,
                offset: offset,
                priority: nil,
                key: nil
            )
            
        }
        
        if axis.contains(.vertical) {
            
            guard let vTarget = _target as? VerticalConstraintTarget else{
                
                caught(
                    LayoutError.invalidConstraintTarget,
                    type: .vertical(.center),
                    source: self.layoutable.centerYAnchor,
                    target: _target
                )
                
                return self
                
            }
            
            addConstraint(
                type: .vertical(.center),
                from: self.layoutable.centerYAnchor,
                to: vTarget,
                relation: relation,
                offset: offset,
                priority: nil,
                key: nil
            )
            
        }
        
        return self
        
    }
    
    // Dimensions
    
    @discardableResult
    func width(_ relation: LayoutRelation = .equal,
               to target: DimensionalConstraintTarget? = nil,
               offset: Constant = 0,
               priority: LayoutPriority? = nil,
               key: String? = nil) -> Self {
        
        return addConstraint(
            type: .dimension(.width),
            from: self.layoutable.widthAnchor,
            to: target ?? self.superview.widthAnchor,
            relation: relation,
            offset: offset,
            priority: priority,
            key: key
        )
        
    }
    
    @discardableResult
    func width(relation: LayoutRelation = .equal,
               _ constant: Constant = 0,
               priority: LayoutPriority? = nil,
               key: String? = nil) -> Self {
        
        return width(
            relation,
            to: constant,
            offset: 0,
            priority: priority,
            key: key
        )
        
    }
    
    @discardableResult
    func height(_ relation: LayoutRelation = .equal,
                to target: DimensionalConstraintTarget? = nil,
                offset: Constant = 0,
                priority: LayoutPriority? = nil,
                key: String? = nil) -> Self {
        
        return addConstraint(
            type: .dimension(.height),
            from: self.layoutable.heightAnchor,
            to: target ?? self.superview.heightAnchor,
            relation: relation,
            offset: offset,
            priority: priority,
            key: key
        )
        
    }
    
    @discardableResult
    func height(relation: LayoutRelation = .equal,
                _ constant: Constant = 0,
                priority: LayoutPriority? = nil,
                key: String? = nil) -> Self {
        
        return height(
            relation,
            to: constant,
            offset: 0,
            priority: priority,
            key: key
        )
        
    }
    
    @discardableResult
    func size(_ relation: LayoutRelation = .equal,
              to target: DimensionalConstraintTarget? = nil,
              offset: Constant = 0) -> Self {
        
        width(
            relation,
            to: target ?? self.superview.widthAnchor,
            offset: offset,
            key: nil
        )
        
        height(
            relation,
            to: target ?? self.superview.heightAnchor,
            offset: offset,
            key: nil
        )
        
        return self
        
    }
    
    @discardableResult
    func size(relation: LayoutRelation = .equal,
              _ constant: Constant = 0) -> Self {
        
        return size(
            relation,
            to: constant,
            offset: 0
        )
        
    }
    
}

public extension LayoutMaker /* Modifiers */ {
    
    @discardableResult
    func hugging(axis: LayoutAxis,
                 _ priority: LayoutPriority) -> Self {
        
        self.layoutable.setContentHuggingPriority(
            priority,
            for: axis
        )
        
        return self
        
    }
    
    @discardableResult
    func compressionResistance(axis: LayoutAxis,
                               _ priority: LayoutPriority) -> Self {
        
        self.layoutable.setContentCompressionResistancePriority(
            priority,
            for: axis
        )
        
        return self
        
    }
    
}
