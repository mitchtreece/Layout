//
//  Layoutable.swift
//  Layout
//
//  Created by Mitch Treece on 7/11/20.
//

#if os(iOS)
    import UIKit
#else
    import AppKit
#endif

private struct AssociatedKeys {
    static var layout: UInt8 = 0
}

public protocol Layoutable: class {
    
    var superview: View? { get }
    var constraints: [LayoutConstraint] { get }
    var translatesAutoresizingMaskIntoConstraints: Bool { get set }

    var leftAnchor: LayoutAxisAnchorX { get }
    var rightAnchor: LayoutAxisAnchorX { get }
    var leadingAnchor: LayoutAxisAnchorX { get }
    var trailingAnchor: LayoutAxisAnchorX { get }
    var topAnchor: LayoutAxisAnchorY { get }
    var bottomAnchor: LayoutAxisAnchorY { get }
    var centerXAnchor: LayoutAxisAnchorX { get }
    var centerYAnchor: LayoutAxisAnchorY { get }
    var widthAnchor: LayoutDimensionAnchor { get }
    var heightAnchor: LayoutDimensionAnchor { get }
    
    var safeAreaLayoutGuide: LayoutGuide { get }
    
    func addConstraint(_ constraint: LayoutConstraint)
    func addConstraints(_ constraints: [LayoutConstraint])
    func removeConstraint(_ constraint: LayoutConstraint)
    func removeConstraints(_ constraints: [LayoutConstraint])
    
    func setContentHuggingPriority(_ priority: LayoutPriority, for axis: LayoutAxis)
    func setContentCompressionResistancePriority(_ priority: LayoutPriority, for axis: LayoutAxis)

}

// MARK: Extensions

extension View: Layoutable {}

public extension Layoutable /* Layout */ {
    
    private(set) var layout: Layout {
        get {
            
            if let layout = objc_getAssociatedObject(self, &AssociatedKeys.layout) as? Layout {
                return layout
            }
            else {
                
                let layout = Layout(self)
                self.layout = layout
                return layout
                
            }
            
        }
        set {
            
            objc_setAssociatedObject(
                self,
                &AssociatedKeys.layout,
                newValue,
                .OBJC_ASSOCIATION_RETAIN_NONATOMIC
            )
            
        }
    }
    
}

internal extension Layoutable /* Debug */ {
    
    var shortDescription: String {
        return "<\(type(of: self)): \(Unmanaged.passUnretained(self).toOpaque())>"
    }
    
}
