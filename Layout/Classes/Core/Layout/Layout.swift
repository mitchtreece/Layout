//
//  Layout.swift
//  Layout
//
//  Created by Mitch Treece on 7/11/20.
//

import Foundation

public class Layout {
            
    internal private(set) weak var layoutable: Layoutable!
    
    lazy public var make: LayoutMaker = {
        return LayoutMaker(self.layoutable)
    }()
    
    public var remake: LayoutMaker {
        self.make.removeAllConstraints()
        return self.make
    }
    
    public var constraints: [Constraint] {
        return self.make.constraints
    }
    
    internal init(_ layoutable: Layoutable) {
        
        self.layoutable = layoutable
        self.layoutable.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    // MARK: Public
    
    public func constraint(forKey key: String) -> WrappedConstraint {
        
        guard let constraint = self.constraints.first(where: { $0.key == key }) else {
            log("\(self.layoutable!.shortDescription) does not contain a constraint for key: \"\(key)\"")
            return WrappedConstraint(nil)
        }
        
        return constraint.wrapped()
        
    }
    
    public func constraints(for type: ConstraintType) -> [Constraint] {
        return self.constraints.filter { $0.type == type }
    }
    
    public func unmake() {
        self.make.removeAllConstraints()
    }
    
    // MARK: Private
    
    private func log(_ message: String) {
        print("📌 <Layout>: \(message)")
    }
    
}

public extension Layout /* Anchors */ {
        
    var left: NSLayoutXAxisAnchor {
        return self.layoutable.leftAnchor
    }
    
    var safeAreaLeft: NSLayoutXAxisAnchor {
        
        return (self.layoutable.superview ?? self.layoutable)
            .safeAreaLayoutGuide
            .leftAnchor
        
    }
    
    var right: NSLayoutXAxisAnchor {
        return self.layoutable.rightAnchor
    }
    
    var safeAreaRight: NSLayoutXAxisAnchor {
        
        return (self.layoutable.superview ?? self.layoutable)
            .safeAreaLayoutGuide
            .rightAnchor
        
    }
    
    var leading: NSLayoutXAxisAnchor {
        return self.layoutable.leadingAnchor
    }
    
    var safeAreaLeading: NSLayoutXAxisAnchor {
        
        return (self.layoutable.superview ?? self.layoutable)
            .safeAreaLayoutGuide
            .leadingAnchor
        
    }
    
    var trailing: NSLayoutXAxisAnchor {
        return self.layoutable.trailingAnchor
    }
    
    var safeAreaTrailing: NSLayoutXAxisAnchor {
        
        return (self.layoutable.superview ?? self.layoutable)
            .safeAreaLayoutGuide
            .trailingAnchor
        
    }
    
    var top: NSLayoutYAxisAnchor {
        return self.layoutable.topAnchor
    }
    
    var safeAreaTop: NSLayoutYAxisAnchor {
        
        return (self.layoutable.superview ?? self.layoutable)
            .safeAreaLayoutGuide
            .topAnchor
        
    }
    
    var bottom: NSLayoutYAxisAnchor {
        return self.layoutable.bottomAnchor
    }
    
    var safeAreaBottom: NSLayoutYAxisAnchor {
        
        return (self.layoutable.superview ?? self.layoutable)
            .safeAreaLayoutGuide
            .bottomAnchor
        
    }
    
    var centerX: NSLayoutXAxisAnchor {
        return self.layoutable.centerXAnchor
    }
    
    var safeAreaCenterX: NSLayoutXAxisAnchor {
        
        return (self.layoutable.superview ?? self.layoutable)
            .safeAreaLayoutGuide
            .centerXAnchor
        
    }
    
    var centerY: NSLayoutYAxisAnchor {
        return self.layoutable.centerYAnchor
    }
    
    var safeAreaCenterY: NSLayoutYAxisAnchor {
        
        return (self.layoutable.superview ?? self.layoutable)
            .safeAreaLayoutGuide
            .centerYAnchor
        
    }
    
    var width: NSLayoutDimension {
        return self.layoutable.widthAnchor
    }
    
    var safeAreaWidth: NSLayoutDimension {
        
        return (self.layoutable.superview ?? self.layoutable)
            .safeAreaLayoutGuide
            .widthAnchor
        
    }
    
    var height: NSLayoutDimension {
        return self.layoutable.heightAnchor
    }
    
    var safeAreaHeight: NSLayoutDimension {
        
        return (self.layoutable.superview ?? self.layoutable)
            .safeAreaLayoutGuide
            .heightAnchor
        
    }
    
}
