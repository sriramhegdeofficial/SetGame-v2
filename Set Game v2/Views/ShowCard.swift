//
//  ShowCard.swift
//  Set Game v2
//
//  Created by sriram on 06/07/20.
//  Copyright © 2020 sriram. All rights reserved.
//

import SwiftUI

struct ShowCard: ViewModifier {
    
    var show : Bool
    
    
    func body(content: Content) -> some View {
        Group {
            if show {
                content
            }
        }
    }
}
