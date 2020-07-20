//
//  LayoutMaker+Shorthand.swift
//  Screwdriver
//
//  Created by Mitch Treece on 7/14/20.
//

import Foundation

public extension LayoutMaker /* Shorthand */ {

    // Horizontal
    
    @discardableResult
    func l(_ relation: LayoutRelation = .equal,
           to target: HorizontalConstraintTarget,
           offset: Constant = 0,
           priority: LayoutPriority? = nil,
           key: String? = nil) -> Self {
        
        return left(
            relation,
            to: target,
            offset: offset,
            priority: priority,
            key: key
        )
        
    }
    
    @discardableResult
    func lead(_ relation: LayoutRelation = .equal,
              to target: HorizontalConstraintTarget,
              offset: Constant = 0,
              priority: LayoutPriority? = nil,
              key: String? = nil) -> Self {
        
        return leading(
            relation,
            to: target,
            offset: offset,
            priority: priority,
            key: key
        )
        
    }
    
    @discardableResult
    func r(_ relation: LayoutRelation = .equal,
           to target: HorizontalConstraintTarget,
           offset: Constant = 0,
           priority: LayoutPriority? = nil,
           key: String? = nil) -> Self {
        
        return right(
            relation,
            to: target,
            offset: offset,
            priority: priority,
            key: key
        )
        
    }
    
    @discardableResult
    func trail(_ relation: LayoutRelation = .equal,
              to target: HorizontalConstraintTarget,
              offset: Constant = 0,
              priority: LayoutPriority? = nil,
              key: String? = nil) -> Self {
        
        return trailing(
            relation,
            to: target,
            offset: offset,
            priority: priority,
            key: key
        )
        
    }
    
    // Vertical
    
    @discardableResult
    func t(_ relation: LayoutRelation = .equal,
           to target: VerticalConstraintTarget,
           offset: Constant = 0,
           priority: LayoutPriority? = nil,
           key: String? = nil) -> Self {
        
        return top(
            relation,
            to: target,
            offset: offset,
            priority: priority,
            key: key
        )
        
    }
    
    @discardableResult
    func b(_ relation: LayoutRelation = .equal,
           to target: VerticalConstraintTarget,
           offset: Constant = 0,
           priority: LayoutPriority? = nil,
           key: String? = nil) -> Self {
        
        return bottom(
            relation,
            to: target,
            offset: offset,
            priority: priority,
            key: key
        )
        
    }

    // Edges
    
    @discardableResult
    func e(_ edges: RectEdge = .all,
           relation: LayoutRelation = .equal,
           to target: AxisConstraintTarget,
           insets: RectEdgeInsets = .zero) -> Self {
        
        return self.edges(
            edges,
            relation: relation,
            to: target,
            insets: insets
        )
        
    }

    // Center

    @discardableResult
    func c(_ axis: Axis = .all,
           relation: LayoutRelation = .equal,
           to target: AxisConstraintTarget,
           offset: Constant = 0) -> Self {
        
        return center(
            axis,
            relation: relation,
            to: target,
            offset: offset
        )
        
    }
    
    // Dimensions
    
    @discardableResult
    func w(_ relation: LayoutRelation = .equal,
           to target: DimensionalConstraintTarget,
           offset: Constant = 0,
           priority: LayoutPriority? = nil,
           key: String? = nil) -> Self {
        
        return width(
            relation,
            to: target,
            offset: offset,
            priority: priority,
            key: key
        )
        
    }
    
    @discardableResult
    func w(relation: LayoutRelation = .equal,
           _ constant: Constant = 0,
           priority: LayoutPriority? = nil,
           key: String? = nil) -> Self {
        
        return width(
            relation: relation,
            constant,
            priority: priority,
            key: key
        )
        
    }
    
    @discardableResult
    func h(_ relation: LayoutRelation = .equal,
           to target: DimensionalConstraintTarget,
           offset: Constant = 0,
           priority: LayoutPriority? = nil,
           key: String? = nil) -> Self {
        
        return height(
            relation,
            to: target,
            offset: offset,
            priority: priority,
            key: key
        )
        
    }
    
    @discardableResult
    func h(relation: LayoutRelation = .equal,
           _ constant: Constant = 0,
           priority: LayoutPriority? = nil,
           key: String? = nil) -> Self {
        
        return height(
            relation: relation,
            constant,
            priority: priority,
            key: key
        )
        
    }
    
    @discardableResult
    func s(_ relation: LayoutRelation = .equal,
           to target: DimensionalConstraintTarget,
           offset: Constant = 0) -> Self {
        
        return size(
            relation,
            to: target,
            offset: offset
        )
        
    }
    
    @discardableResult
    func s(relation: LayoutRelation = .equal,
           _ constant: Constant = 0) -> Self {
        
        return size(
            relation: relation,
            constant
        )
        
    }

}
