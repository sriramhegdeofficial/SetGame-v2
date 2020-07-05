//
//  MaskingRect.swift
//  Set Game
//
//  Created by sriram on 25/06/20.
//  Copyright © 2020 iWeds. All rights reserved.
//

import SwiftUI

struct MaskingRect: Shape {
    

   
     
     func path(in rect: CGRect) -> Path {
        var offset : CGFloat = 0
        
        var p = Path()
       
        
        
        while offset < rect.height {
            
            p.move(to: CGPoint(x: 0, y: 0 + offset))
            p.addLine(to: CGPoint(x: rect.width, y: 0 + offset))
            p.closeSubpath()
            
            offset = offset + 8
        }
        
        
        
        return p
    }
    
    
}

