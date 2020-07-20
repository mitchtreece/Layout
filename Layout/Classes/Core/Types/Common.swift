//
//  Common.swift
//  Layout
//
//  Created by Mitch Treece on 7/11/20.
//

public typealias LayoutConstraint      = NSLayoutConstraint
public typealias LayoutRelation        = NSLayoutRelation
public typealias LayoutAxisAnchorX     = NSLayoutXAxisAnchor
public typealias LayoutAxisAnchorY     = NSLayoutYAxisAnchor
public typealias LayoutDimensionAnchor = NSLayoutDimension

#if os(iOS)
    
    import UIKit
    
    public typealias View               = UIView
    public typealias LayoutGuide        = UILayoutGuide
    public typealias LayoutPriority     = UILayoutPriority
    public typealias LayoutAxis         = NSLayoutConstraint.Axis

#else

    import AppKit

    public typealias View               = NSView
    public typealias LayoutGuide        = NSLayoutGuide
    public typealias LayoutPriority     = NSLayoutConstraint.Priority
    public typealias LayoutAxis         = NSLayoutConstraint.Orientation
    
#endif

