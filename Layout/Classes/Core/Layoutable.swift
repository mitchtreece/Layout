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
    var constraints: [NSLayoutConstraint] { get }
    var translatesAutoresizingMaskIntoConstraints: Bool { get set }

    var leftAnchor: NSLayoutXAxisAnchor { get }
    var rightAnchor: NSLayoutXAxisAnchor { get }
    var leadingAnchor: NSLayoutXAxisAnchor { get }
    var trailingAnchor: NSLayoutXAxisAnchor { get }
    var topAnchor: NSLayoutYAxisAnchor { get }
    var bottomAnchor: NSLayoutYAxisAnchor { get }
    var centerXAnchor: NSLayoutXAxisAnchor { get }
    var centerYAnchor: NSLayoutYAxisAnchor { get }
    var widthAnchor: NSLayoutDimension { get }
    var heightAnchor: NSLayoutDimension { get }
    var safeAreaLayoutGuide: LayoutGuide { get }
    
    func addConstraint(_ constraint: NSLayoutConstraint)
    func addConstraints(_ constraints: [NSLayoutConstraint])
    func removeConstraint(_ constraint: NSLayoutConstraint)
    func removeConstraints(_ constraints: [NSLayoutConstraint])
    
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
