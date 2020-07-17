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
                        type: ConstraintType,
                        source: ConstraintProvider,
                        target: ConstraintTarget) {
        
        guard let sdError = error as? ScrewdriverError else {
            log(error.localizedDescription)
            return
        }
        
        switch sdError {
        case .notImplemented: break
        case .invalidLayoutAnchor: break
        case .invalidConstraintProvider: break
        case .invalidConstraintTarget: break
        case .constraintNotFound: break
        }
        
        log(error.localizedDescription)
        
    }
        
    private func log(_ message: String) {
        print("📌 <Layout>: \(message)")
    }
        
}

public extension LayoutMaker {
    
    @discardableResult
    private func addConstraint(type: ConstraintType,
                               relation: LayoutRelation,
                               from provider: ConstraintProvider,
                               to target: ConstraintTarget,
                               offset: Constant,
                               key: String?) -> Self {
        
        do {
            
            let layoutConstraint = try ConstraintBuilder.addConstraint(
                from: provider,
                type: type,
                to: target,
                relation: relation,
                offset: offset.value
            )
            
            layoutConstraint.isActive = true
            
            self.constraints.append(Constraint(
                layoutConstraint,
                type: type,
                key: key
            ))
            
        }
        catch {
            
            caught(
                error,
                type: type,
                source: provider,
                target: target
            )
            
        }
        
        return self
        
    }
 
    // Horizontal
    
    @discardableResult
    func left(_ relation: LayoutRelation = .equal,
              to target: HorizontalConstraintTarget,
              offset: Constant = 0,
              key: String? = nil) -> Self {
        
        return addConstraint(
            type: .horizontal(.left),
            relation: relation,
            from: self.layoutable.leftAnchor,
            to: target,
            offset: offset,
            key: key
        )
        
    }
    
    @discardableResult
    func leftToSuperview(_ relation: LayoutRelation = .equal,
                         offset: Constant = 0,
                         key: String? = nil) -> Self {
        
        return addConstraint(
            type: .horizontal(.left),
            relation: relation,
            from: self.layoutable.leftAnchor,
            to: self.superview.leftAnchor,
            offset: offset,
            key: key
        )
        
    }
    
    @discardableResult
    func leftToSafeArea(_ relation: LayoutRelation = .equal,
                        offset: Constant = 0,
                        key: String? = nil) -> Self {
        
        return addConstraint(
            type: .horizontal(.left),
            relation: relation,
            from: self.layoutable.leftAnchor,
            to: self.safeArea.leftAnchor,
            offset: offset,
            key: key
        )
        
    }
    
    @discardableResult
    func leading(_ relation: LayoutRelation = .equal,
                 to target: HorizontalConstraintTarget,
                 offset: Constant = 0,
                 key: String? = nil) -> Self {
        
        return addConstraint(
            type: .horizontal(.leading),
            relation: relation,
            from: self.layoutable.leadingAnchor,
            to: target,
            offset: offset,
            key: key
        )
        
    }
    
    @discardableResult
    func leadingToSuperview(_ relation: LayoutRelation = .equal,
                            offset: Constant = 0,
                            key: String? = nil) -> Self {
        
        return addConstraint(
            type: .horizontal(.leading),
            relation: relation,
            from: self.layoutable.leadingAnchor,
            to: self.superview.leadingAnchor,
            offset: offset,
            key: key
        )
        
    }
    
    @discardableResult
    func leadingToSafeArea(_ relation: LayoutRelation = .equal,
                           offset: Constant = 0,
                           key: String? = nil) -> Self {
        
        return addConstraint(
            type: .horizontal(.leading),
            relation: relation,
            from: self.layoutable.leadingAnchor,
            to: self.safeArea.leadingAnchor,
            offset: offset,
            key: key
        )
        
    }
    
    @discardableResult
    func right(_ relation: LayoutRelation = .equal,
               to target: HorizontalConstraintTarget,
               offset: Constant = 0,
               key: String? = nil) -> Self {
        
        return addConstraint(
            type: .horizontal(.right),
            relation: relation,
            from: self.layoutable.rightAnchor,
            to: target,
            offset: offset,
            key: key
        )
        
    }
    
    @discardableResult
    func rightToSuperview(_ relation: LayoutRelation = .equal,
                          offset: Constant = 0,
                          key: String? = nil) -> Self {
        
        return addConstraint(
            type: .horizontal(.right),
            relation: relation,
            from: self.layoutable.rightAnchor,
            to: self.superview.rightAnchor,
            offset: offset,
            key: key
        )
        
    }
    
    @discardableResult
    func rightToSafeArea(_ relation: LayoutRelation = .equal,
                         offset: Constant = 0,
                         key: String? = nil) -> Self {
        
        return addConstraint(
            type: .horizontal(.right),
            relation: relation,
            from: self.layoutable.rightAnchor,
            to: self.safeArea.rightAnchor,
            offset: offset,
            key: key
        )
        
    }
    
    @discardableResult
    func trailing(_ relation: LayoutRelation = .equal,
                  to target: HorizontalConstraintTarget,
                  offset: Constant = 0,
                  key: String? = nil) -> Self {
        
        return addConstraint(
            type: .horizontal(.trailing),
            relation: relation,
            from: self.layoutable.trailingAnchor,
            to: target,
            offset: offset,
            key: key
        )
        
    }
    
    @discardableResult
    func trailingToSuperview(_ relation: LayoutRelation = .equal,
                             offset: Constant = 0,
                             key: String? = nil) -> Self {
        
        return addConstraint(
            type: .horizontal(.trailing),
            relation: relation,
            from: self.layoutable.trailingAnchor,
            to: self.superview.trailingAnchor,
            offset: offset,
            key: key
        )
        
    }
    
    @discardableResult
    func trailingToSafeArea(_ relation: LayoutRelation = .equal,
                            offset: Constant = 0,
                            key: String? = nil) -> Self {
        
        return addConstraint(
            type: .horizontal(.trailing),
            relation: relation,
            from: self.layoutable.trailingAnchor,
            to: self.safeArea.trailingAnchor,
            offset: offset,
            key: key
        )
        
    }
    
    // Vertical
    
    @discardableResult
    func top(_ relation: LayoutRelation = .equal,
             to target: VerticalConstraintTarget,
             offset: Constant = 0,
             key: String? = nil) -> Self {
        
        return addConstraint(
            type: .vertical(.top),
            relation: relation,
            from: self.layoutable.topAnchor,
            to: target,
            offset: offset,
            key: key
        )
        
    }
    
    @discardableResult
    func topToSuperview(_ relation: LayoutRelation = .equal,
                        offset: Constant = 0,
                        key: String? = nil) -> Self {
        
        return addConstraint(
            type: .vertical(.top),
            relation: relation,
            from: self.layoutable.topAnchor,
            to: self.superview.topAnchor,
            offset: offset,
            key: key
        )
        
    }
    
    @discardableResult
    func topToSafeArea(_ relation: LayoutRelation = .equal,
                       offset: Constant = 0,
                       key: String? = nil) -> Self {
        
        return addConstraint(
            type: .vertical(.top),
            relation: relation,
            from: self.layoutable.topAnchor,
            to: self.safeArea.topAnchor,
            offset: offset,
            key: key
        )
        
    }
    
    @discardableResult
    func bottom(_ relation: LayoutRelation = .equal,
                to target: VerticalConstraintTarget,
                offset: Constant = 0,
                key: String? = nil) -> Self {
        
        return addConstraint(
            type: .vertical(.bottom),
            relation: relation,
            from: self.layoutable.bottomAnchor,
            to: target,
            offset: offset,
            key: key
        )
        
    }
    
    @discardableResult
    func bottomToSuperview(_ relation: LayoutRelation = .equal,
                           offset: Constant = 0,
                           key: String? = nil) -> Self {
        
        return addConstraint(
            type: .vertical(.bottom),
            relation: relation,
            from: self.layoutable.bottomAnchor,
            to: self.superview.bottomAnchor,
            offset: offset,
            key: key
        )
        
    }
    
    @discardableResult
    func bottomToSafeArea(_ relation: LayoutRelation = .equal,
                          offset: Constant = 0,
                          key: String? = nil) -> Self {
        
        return addConstraint(
            type: .vertical(.bottom),
            relation: relation,
            from: self.layoutable.bottomAnchor,
            to: self.safeArea.bottomAnchor,
            offset: offset,
            key: key
        )
        
    }
    
    // Edges
    
    @discardableResult
    func edges(_ edges: RectEdge = .all,
               relation: LayoutRelation = .equal,
               to target: AxisConstraintTarget,
               insets: EdgeInsets = .zero) -> Self {
        
        if edges.contains(.top) {
            
            guard let vTarget = target as? VerticalConstraintTarget else {
                                
                caught(
                    ScrewdriverError.invalidConstraintTarget,
                    type: .vertical(.top),
                    source: self.layoutable.topAnchor,
                    target: target
                )
                
                return self
                
            }
            
            top(
                relation,
                to: vTarget,
                offset: insets.top,
                key: nil
            )
            
        }
        
        if edges.contains(.bottom) {
            
            guard let vTarget = target as? VerticalConstraintTarget else {
                
                caught(
                    ScrewdriverError.invalidConstraintTarget,
                    type: .vertical(.bottom),
                    source: self.layoutable.bottomAnchor,
                    target: target
                )
                
                return self
                
            }
            
            bottom(
                relation,
                to: vTarget,
                offset: insets.bottom,
                key: nil
            )
            
        }
        
        if edges.contains(.left) {
            
            guard let hTarget = target as? HorizontalConstraintTarget else {
                
                caught(
                    ScrewdriverError.invalidConstraintTarget,
                    type: .horizontal(.left),
                    source: self.layoutable.leftAnchor,
                    target: target
                )
                
                return self
                
            }
            
            left(
                relation,
                to: hTarget,
                offset: insets.left,
                key: nil
            )
            
        }
        
        if edges.contains(.right) {
            
            guard let hTarget = target as? HorizontalConstraintTarget else {
                
                caught(
                    ScrewdriverError.invalidConstraintTarget,
                    type: .horizontal(.right),
                    source: self.layoutable.rightAnchor,
                    target: target
                )
                
                return self
                
            }
            
            right(
                relation,
                to: hTarget,
                offset: insets.right,
                key: nil
            )
            
        }
        
        return self
        
    }
    
    @discardableResult
    func edgesToSuperview(_ edges: RectEdge = .all,
                          relation: LayoutRelation = .equal,
                          insets: EdgeInsets = .zero) -> Self {
        
        return self.edges(
            edges,
            relation: relation,
            to: self.superview,
            insets: insets
        )
        
    }
    
    @discardableResult
    func edgesToSafeArea(_ edges: RectEdge = .all,
                         relation: LayoutRelation = .equal,
                         insets: EdgeInsets = .zero) -> Self {
        
        if edges.contains(.top) {
            
            top(
                relation,
                to: self.safeArea.topAnchor,
                offset: insets.top,
                key: nil
            )
            
        }
        
        if edges.contains(.bottom) {
            
            bottom(
                relation,
                to: self.safeArea.bottomAnchor,
                offset: insets.bottom,
                key: nil
            )
            
        }
        
        if edges.contains(.left) {
            
            left(
                relation,
                to: self.safeArea.leftAnchor,
                offset: insets.left,
                key: nil
            )
            
        }
        
        if edges.contains(.right) {
            
            right(
                relation,
                to: self.safeArea.rightAnchor,
                offset: insets.right,
                key: nil
            )
            
        }
        
        return self
        
    }
    
    // Center
    
    @discardableResult
    func center(_ axis: Axis = .all,
                relation: LayoutRelation = .equal,
                to target: AxisConstraintTarget,
                offset: Constant = 0) -> Self {
        
        if axis.contains(.horizonatal) {
            
            guard let hTarget = target as? HorizontalConstraintTarget else{
                
                caught(
                    ScrewdriverError.invalidConstraintTarget,
                    type: .horizontal(.center),
                    source: self.layoutable.centerXAnchor,
                    target: target
                )
                
                return self
                
            }
            
            addConstraint(
                type: .horizontal(.center),
                relation: relation,
                from: self.layoutable.centerXAnchor,
                to: hTarget,
                offset: offset,
                key: nil
            )
            
        }
        
        if axis.contains(.vertical) {
            
            guard let vTarget = target as? VerticalConstraintTarget else{
                
                caught(
                    ScrewdriverError.invalidConstraintTarget,
                    type: .vertical(.center),
                    source: self.layoutable.centerYAnchor,
                    target: target
                )
                
                return self
                
            }
            
            addConstraint(
                type: .vertical(.center),
                relation: relation,
                from: self.layoutable.centerYAnchor,
                to: vTarget,
                offset: offset,
                key: nil
            )
            
        }
        
        return self
        
    }
    
    @discardableResult
    func centerToSuperview(_ axis: Axis = .all,
                           relation: LayoutRelation = .equal,
                           offset: Constant = 0) -> Self {
        
        return center(
            axis,
            relation: relation,
            to: self.superview,
            offset: offset
        )
        
    }
    
    // Dimensions
    
    @discardableResult
    func width(_ relation: LayoutRelation = .equal,
               to target: DimensionalConstraintTarget,
               offset: Constant = 0,
               key: String? = nil) -> Self {
        
        return addConstraint(
            type: .dimension(.width),
            relation: relation,
            from: self.layoutable.widthAnchor,
            to: target,
            offset: offset,
            key: key
        )
        
    }
    
    @discardableResult
    func width(relation: LayoutRelation = .equal,
               _ constant: Constant = 0,
               key: String? = nil) -> Self {
        
        return width(
            relation,
            to: constant,
            offset: 0,
            key: key
        )
        
    }
    
    @discardableResult
    func widthToSuperview(_ relation: LayoutRelation = .equal,
                          offset: Constant = 0,
                          key: String? = nil) -> Self {
        
        return width(
            relation,
            to: self.superview.widthAnchor,
            offset: offset,
            key: key
        )
        
    }
    
    @discardableResult
    func height(_ relation: LayoutRelation = .equal,
                to target: DimensionalConstraintTarget,
                offset: Constant = 0,
                key: String? = nil) -> Self {
        
        return addConstraint(
            type: .dimension(.height),
            relation: relation,
            from: self.layoutable.heightAnchor,
            to: target,
            offset: offset,
            key: key
        )
        
    }
    
    @discardableResult
    func height(relation: LayoutRelation = .equal,
                _ constant: Constant = 0,
                key: String? = nil) -> Self {
        
        return height(
            relation,
            to: constant,
            offset: 0,
            key: key
        )
        
    }
    
    @discardableResult
    func heightToSuperview(_ relation: LayoutRelation = .equal,
                           offset: Constant = 0,
                           key: String? = nil) -> Self {
        
        return height(
            relation,
            to: self.superview,
            offset: offset,
            key: key
        )
        
    }
    
    @discardableResult
    func size(_ relation: LayoutRelation = .equal,
              to target: DimensionalConstraintTarget,
              offset: Constant = 0) -> Self {
        
        width(
            relation,
            to: target,
            offset: offset,
            key: nil
        )
        
        height(
            relation,
            to: target,
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
    
    @discardableResult
    func sizeToSuperview(_ relation: LayoutRelation = .equal,
                         offset: Constant = 0) -> Self {
        
        return size(
            relation,
            to: self.superview,
            offset: offset
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
