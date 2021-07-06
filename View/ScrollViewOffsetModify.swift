//
//  ScrollViewOffsetModify.swift
//  UI-254
//
//  Created by nyannyan0328 on 2021/07/06.
//

import SwiftUI

struct ScrollViewOffsetModify: ViewModifier {
    
    @Binding var offset : CGFloat
    
    
    var anchorPoint : Anchor = .top
    func body(content: Content) -> some View {
        
        content
            .overlay(
            
            
                GeometryReader{proxy -> Color in
                
                let frame = proxy.frame(in: .global)
                
                
                
                DispatchQueue.main.async {
                    
                    switch anchorPoint {
                    case .top:
                        
                        offset = frame.minY
                        
                    case .bottome:
                        offset = frame.maxY
                    case .leading:
                        offset = frame.minX
                    case .trailing:
                        offset = frame.maxX
                    }
                    
                    
                }
                
                
                return Color.clear
            }
            
            )
        
            
    }
}

enum Anchor{
    
    case top
    case bottome
    case leading
    case trailing
    
    
}

