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

extension LayoutAxisAnchorX: HorizontalConstraintTarget {}
extension LayoutAxisAnchorY: VerticalConstraintTarget {}
extension LayoutDimensionAnchor: DimensionalConstraintTarget {}
extension LayoutAnchorContainer: AxisConstraintTarget, HorizontalConstraintTarget, VerticalConstraintTarget, DimensionalConstraintTarget {}
extension LayoutGuide: AxisConstraintTarget, HorizontalConstraintTarget, VerticalConstraintTarget, DimensionalConstraintTarget {}
extension View: AxisConstraintTarget, HorizontalConstraintTarget, VerticalConstraintTarget, DimensionalConstraintTarget {}
