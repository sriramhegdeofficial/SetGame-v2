//
//  Grid.swift
//  Set Game v2
//
//  Created by sriram on 04/07/20.
//  Copyright © 2020 sriram. All rights reserved.
//

import SwiftUI

import SwiftUI

struct Grid<Item, ItemView> : View where Item : Identifiable, ItemView : View{
    private var items : Array<Item>
    private var viewForItem : (Item) -> ItemView
    
    
    init(_ items: Array<Item>, viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }
    
    func getLayout(itemsCount: Int, size: CGSize) -> GridLayout {
        GridLayout(itemCount: itemsCount, in: size)
    }
    

    
    var body: some View {
        GeometryReader { geometry in
            
            ForEach(self.items) { item in
               self.viewForItem(item)
                .frame(width: self.getLayout(itemsCount: self.items.count, size: geometry.size).itemSize.width,
                       height: self.getLayout(itemsCount: self.items.count, size: geometry.size).itemSize.height)
                        .position(self.getLayout(itemsCount: self.items.count, size: geometry.size)
                        .location(ofItemAt: self.items.firstIndex(of: item)!))
            }
        }
        
    }
}
