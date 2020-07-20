//
//  LayoutAnchorContainer.swift
//  Layout-Swift
//
//  Created by Mitch Treece on 7/18/20.
//

import Foundation

public struct LayoutAnchorContainer {
    
    internal var left: LayoutAxisAnchorX?
    internal var right: LayoutAxisAnchorX?
    internal var leading: LayoutAxisAnchorX?
    internal var trailing: LayoutAxisAnchorX?
    internal var top: LayoutAxisAnchorY?
    internal var bottom: LayoutAxisAnchorY?
    
    internal var safeAreaLeft: LayoutAxisAnchorX?
    internal var safeAreaRight: LayoutAxisAnchorX?
    internal var safeAreaLeading: LayoutAxisAnchorX?
    internal var safeAreaTrailing: LayoutAxisAnchorX?
    internal var safeAreaTop: LayoutAxisAnchorY?
    internal var safeAreaBottom: LayoutAxisAnchorY?
    
    internal var centerX: LayoutAxisAnchorX?
    internal var centerY: LayoutAxisAnchorY?
    
    internal var width: LayoutDimensionAnchor?
    internal var height: LayoutDimensionAnchor?
    
    internal init() {
        //
    }
    
}
