//
//  Array+Identifiables.swift
//  Set Game v2
//
//  Created by sriram on 04/07/20.
//  Copyright © 2020 sriram. All rights reserved.
//

import Swift

import Foundation

extension Array where Element : Identifiable {
    
    func firstIndex(of item: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == item.id {
                return index
            }
        }
        return nil
    }
}


