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
            Layout.log("\(self.layoutable!.shortDescription) does not contain a constraint for key: \"\(key)\"")
            return WrappedConstraint(nil)
        }
        
        return constraint.wrapped()
        
    }
    
    public func constraints(for type: Constraint.ConstraintType) -> [Constraint] {
        return self.constraints.filter { $0.type == type }
    }
    
    public func unmake() {
        self.make.removeAllConstraints()
    }
    
    // MARK: Private
    
    internal static func log(_ message: String) {
        print("📌 <Layout>: \(message)")
    }
    
}

public extension Layout /* Anchors */ {
        
    var left: LayoutAxisAnchorX {
        return self.layoutable.leftAnchor
    }
    
    var right: LayoutAxisAnchorX {
        return self.layoutable.rightAnchor
    }
    
    var leading: LayoutAxisAnchorX {
        return self.layoutable.leadingAnchor
    }
    
    var trailing: LayoutAxisAnchorX {
        return self.layoutable.trailingAnchor
    }
    
    var top: LayoutAxisAnchorY {
        return self.layoutable.topAnchor
    }
    
    var bottom: LayoutAxisAnchorY {
        return self.layoutable.bottomAnchor
    }

    var safeArea: LayoutGuide {
        return self.layoutable.safeAreaLayoutGuide
    }
    
//    var safeAreaLeft: LayoutAxisAnchorX {
//
//        return (self.layoutable.superview ?? self.layoutable)
//            .safeAreaLayoutGuide
//            .leftAnchor
//
//    }
//
//    var safeAreaRight: LayoutAxisAnchorX {
//
//        return (self.layoutable.superview ?? self.layoutable)
//            .safeAreaLayoutGuide
//            .rightAnchor
//
//    }
//
//    var safeAreaLeading: LayoutAxisAnchorX {
//
//        return (self.layoutable.superview ?? self.layoutable)
//            .safeAreaLayoutGuide
//            .leadingAnchor
//
//    }
//
//    var safeAreaTrailing: LayoutAxisAnchorX {
//
//        return (self.layoutable.superview ?? self.layoutable)
//            .safeAreaLayoutGuide
//            .trailingAnchor
//
//    }
//
//    var safeAreaTop: LayoutAxisAnchorY {
//
//        return (self.layoutable.superview ?? self.layoutable)
//            .safeAreaLayoutGuide
//            .topAnchor
//
//    }
//
//    var safeAreaBottom: LayoutAxisAnchorY {
//
//        return (self.layoutable.superview ?? self.layoutable)
//            .safeAreaLayoutGuide
//            .bottomAnchor
//
//    }
//
//    var safeAreaEdges: LayoutAnchorContainer {
//
//        let guide = (self.layoutable.superview ?? self.layoutable)
//            .safeAreaLayoutGuide
//
//        var anchor = LayoutAnchorContainer()
//        anchor.top = guide.topAnchor
//        anchor.bottom = guide.bottomAnchor
//        anchor.left = guide.leftAnchor
//        anchor.right = guide.rightAnchor
//
//        return anchor
//
//    }
    
    var centerX: LayoutAxisAnchorX {
        return self.layoutable.centerXAnchor
    }
    
    var centerY: LayoutAxisAnchorY {
        return self.layoutable.centerYAnchor
    }
    
    var width: LayoutDimensionAnchor {
        return self.layoutable.widthAnchor
    }

    var height: LayoutDimensionAnchor {
        return self.layoutable.heightAnchor
    }
    
    var size: LayoutAnchorContainer {
        
        var anchor = LayoutAnchorContainer()
        anchor.width = self.layoutable.widthAnchor
        anchor.height = self.layoutable.heightAnchor
        return anchor
        
    }
    
}
