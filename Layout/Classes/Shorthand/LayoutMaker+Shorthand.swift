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
           key: String? = nil) -> Self {
        
        return left(
            relation,
            to: target,
            offset: offset,
            key: key
        )
        
    }
    
    @discardableResult
    func l2su(_ relation: LayoutRelation = .equal,
              offset: Constant = 0,
              key: String? = nil) -> Self {
        
        return leftToSuperview(
            relation,
            offset: offset,
            key: key
        )
        
    }
    
    @discardableResult
    func l2sa(_ relation: LayoutRelation = .equal,
                 offset: Constant = 0,
                 key: String? = nil) -> Self {
        
        return leftToSafeArea(
            relation,
            offset: offset,
            key: key
        )
        
    }
    
    @discardableResult
    func lead(_ relation: LayoutRelation = .equal,
              to target: HorizontalConstraintTarget,
              offset: Constant = 0,
              key: String? = nil) -> Self {
        
        return leading(
            relation,
            to: target,
            offset: offset,
            key: key
        )
        
    }
    
    @discardableResult
    func lead2su(_ relation: LayoutRelation = .equal,
                 offset: Constant = 0,
                 key: String? = nil) -> Self {
        
        return leadingToSuperview(
            relation,
            offset: offset,
            key: key
        )
        
    }
    
    @discardableResult
    func lead2sa(_ relation: LayoutRelation = .equal,
                 offset: Constant = 0,
                 key: String? = nil) -> Self {
        
        return leadingToSafeArea(
            relation,
            offset: offset,
            key: key
        )
        
    }
    
    @discardableResult
    func r(_ relation: LayoutRelation = .equal,
           to target: HorizontalConstraintTarget,
           offset: Constant = 0,
           key: String? = nil) -> Self {
        
        return right(
            relation,
            to: target,
            offset: offset,
            key: key
        )
        
    }
    
    @discardableResult
    func r2su(_ relation: LayoutRelation = .equal,
              offset: Constant = 0,
              key: String? = nil) -> Self {
        
        return rightToSuperview(
            relation,
            offset: offset,
            key: key
        )
        
    }
    
    @discardableResult
    func r2sa(_ relation: LayoutRelation = .equal,
                 offset: Constant = 0,
                 key: String? = nil) -> Self {
        
        return rightToSafeArea(
            relation,
            offset: offset,
            key: key
        )
        
    }
    
    @discardableResult
    func trail(_ relation: LayoutRelation = .equal,
              to target: HorizontalConstraintTarget,
              offset: Constant = 0,
              key: String? = nil) -> Self {
        
        return trailing(
            relation,
            to: target,
            offset: offset,
            key: key
        )
        
    }
    
    @discardableResult
    func trail2su(_ relation: LayoutRelation = .equal,
                 offset: Constant = 0,
                 key: String? = nil) -> Self {
        
        return trailingToSuperview(
            relation,
            offset: offset,
            key: key
        )
        
    }
    
    @discardableResult
    func trail2sa(_ relation: LayoutRelation = .equal,
                 offset: Constant = 0,
                 key: String? = nil) -> Self {
        
        return trailingToSafeArea(
            relation,
            offset: offset,
            key: key
        )
        
    }
    
    // Vertical
    
    @discardableResult
    func t(_ relation: LayoutRelation = .equal,
           to target: VerticalConstraintTarget,
           offset: Constant = 0,
           key: String? = nil) -> Self {
        
        return top(
            relation,
            to: target,
            offset: offset,
            key: key
        )
        
    }
    
    @discardableResult
    func t2su(_ relation: LayoutRelation = .equal,
              offset: Constant = 0,
              key: String? = nil) -> Self {
        
        return topToSuperview(
            relation,
            offset: offset,
            key: key
        )
        
    }
    
    @discardableResult
    func t2sa(_ relation: LayoutRelation = .equal,
              offset: Constant = 0,
              key: String? = nil) -> Self {
        
        return topToSafeArea(
            relation,
            offset: offset,
            key: key
        )
        
    }
    
    @discardableResult
    func b(_ relation: LayoutRelation = .equal,
           to target: VerticalConstraintTarget,
           offset: Constant = 0,
           key: String? = nil) -> Self {
        
        return bottom(
            relation,
            to: target,
            offset: offset,
            key: key
        )
        
    }
    
    @discardableResult
    func b2su(_ relation: LayoutRelation = .equal,
              offset: Constant = 0,
              key: String? = nil) -> Self {
        
        return bottomToSuperview(
            relation,
            offset: offset,
            key: key
        )
        
    }
    
    @discardableResult
    func b2sa(_ relation: LayoutRelation = .equal,
              offset: Constant = 0,
              key: String? = nil) -> Self {
        
        return bottomToSafeArea(
            relation,
            offset: offset,
            key: key
        )
        
    }

    // Edges
    
    @discardableResult
    func e(_ edges: RectEdge = .all,
           relation: LayoutRelation = .equal,
           to target: AxisConstraintTarget,
           insets: EdgeInsets = .zero) -> Self {
        
        return self.edges(
            edges,
            relation: relation,
            to: target,
            insets: insets
        )
        
    }
    
    @discardableResult
    func e2su(_ edges: RectEdge = .all,
              relation: LayoutRelation = .equal,
              insets: EdgeInsets = .zero) -> Self {
        
        return edgesToSuperview(
            edges,
            relation: relation,
            insets: insets
        )
        
    }
    
    @discardableResult
    func e2sa(_ edges: RectEdge = .all,
              relation: LayoutRelation = .equal,
              insets: EdgeInsets = .zero) -> Self {
        
        return edgesToSafeArea(
            edges,
            relation: relation,
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
    
    @discardableResult
    func c2su(_ axis: Axis = .all,
              relation: LayoutRelation = .equal,
              offset: Constant = 0) -> Self {
        
        return centerToSuperview(
            axis,
            relation: relation,
            offset: offset
        )
        
    }
    
    // Dimensions
    
    @discardableResult
    func w(_ relation: LayoutRelation = .equal,
           to target: DimensionalConstraintTarget,
           offset: Constant = 0,
           key: String? = nil) -> Self {
        
        return width(
            relation,
            to: target,
            offset: offset,
            key: key
        )
        
    }
    
    @discardableResult
    func w(relation: LayoutRelation = .equal,
           _ constant: Constant = 0,
           key: String? = nil) -> Self {
        
        return width(
            relation: relation,
            constant,
            key: key
        )
        
    }
    
    @discardableResult
    func w2su(_ relation: LayoutRelation = .equal,
              offset: Constant = 0,
              key: String? = nil) -> Self {
        
        return widthToSuperview(
            relation,
            offset: offset,
            key: key
        )
        
    }
    
    @discardableResult
    func h(_ relation: LayoutRelation = .equal,
           to target: DimensionalConstraintTarget,
           offset: Constant = 0,
           key: String? = nil) -> Self {
        
        return height(
            relation,
            to: target,
            offset: offset,
            key: key
        )
        
    }
    
    @discardableResult
    func h(relation: LayoutRelation = .equal,
           _ constant: Constant = 0,
           key: String? = nil) -> Self {
        
        return height(
            relation: relation,
            constant,
            key: key
        )
        
    }
    
    @discardableResult
    func h2su(_ relation: LayoutRelation = .equal,
              offset: Constant = 0,
              key: String? = nil) -> Self {
        
        return heightToSuperview(
            relation,
            offset: offset,
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
    
    @discardableResult
    func s2su(_ relation: LayoutRelation = .equal,
              offset: Constant = 0) -> Self {
        
        return sizeToSuperview(
            relation,
            offset: offset
        )
        
    }

}
