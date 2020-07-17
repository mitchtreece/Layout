//
//  ConstraintType.swift
//  Layout
//
//  Created by Mitch Treece on 7/13/20.
//

import Foundation

public enum ConstraintType: Hashable {
        
    public enum HorizontalType {
        
        case left
        case right
        case leading
        case trailing
        case center
        
    }
    
    public enum VerticalType {
        
        case top
        case bottom
        case center
        
    }
    
    public enum DimensionType {
        
        case width
        case height
        
    }
    
    case horizontal(HorizontalType)
    case vertical(VerticalType)
    case dimension(DimensionType)
    
}
