//
//  ConstraintTarget.swift
//  Layout
//
//  Created by Mitch Treece on 7/11/20.
//

import Foundation

// MARK: Protocols

public protocol ConstraintTarget {}
public protocol AxisConstraintTarget: ConstraintTarget {}
public protocol HorizontalConstraintTarget: AxisConstraintTarget {}
public protocol VerticalConstraintTarget: AxisConstraintTarget {}
public protocol DimensionalConstraintTarget: ConstraintTarget {}

// MARK: Extensions

extension View: HorizontalConstraintTarget {}
extension View: VerticalConstraintTarget {}
extension View: DimensionalConstraintTarget {}

extension NSLayoutXAxisAnchor: HorizontalConstraintTarget {}
extension NSLayoutYAxisAnchor: VerticalConstraintTarget {}
extension NSLayoutDimension: DimensionalConstraintTarget {}
