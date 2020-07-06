//
//  Cardify.swift
//  Set Game v2
//
//  Created by sriram on 06/07/20.
//  Copyright © 2020 sriram. All rights reserved.
//

import SwiftUI


struct Cardify: ViewModifier {
    
    var isSelected : Bool
        

    
    
    
    func body(content: Content) -> some View {
        
        ZStack {
                            Group {
                                    ZStack {
                                            RoundedRectangle(cornerRadius: 10)
                                            .stroke(isSelected ? Color.black : Color.gray, lineWidth: isSelected ? 9 : 5)
                                            .zIndex(0)
                                           
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color.white)
                                            .zIndex(1)
                                            
                                        content
                                            .zIndex(2)
                }
            }
        }
    }
}
