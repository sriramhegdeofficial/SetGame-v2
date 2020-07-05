//
//  SetCardGameView.swift
//  Set Game v2
//
//  Created by sriram on 04/07/20.
//  Copyright © 2020 sriram. All rights reserved.
//

import SwiftUI

struct SetCardGameView: View {
    
    @ObservedObject var setGameViewModel : SetGameViewModel
    
    var body: some View {
        
        Grid(self.setGameViewModel.playingTwelveSetCards) { setCard in
            
            CardView(setCard: setCard)
                    .padding(7)
                    .onTapGesture {
                        self.setGameViewModel.choose(setCard: setCard)
                    }
        }
            
                
        
       
            
        
    }
    
}






struct CardView : View {
    
    @State private var isLoading : Bool = false
    
    
    
    
    var colorValue : ColorValue
    var shapeName : ShapeName
    var shading : Shadings
    var count : Int
    var isMatched : Bool
    var isSelected : Bool
    
    
    
    var randomXOffsetValue : CGFloat = generateRandomNumberForOffset(uValue: 300, lValue: -300)
    var randomYOffsetValue : CGFloat = generateRandomNumberForOffset(uValue: 300, lValue: -300)
    
    
    
    init(setCard: SetGame.SetCard) {
        self.colorValue = setCard.color
        self.shapeName = setCard.shapeName
        self.shading = setCard.shading
        self.count = setCard.count
        self.isMatched = setCard.isMatched
        self.isSelected = setCard.isSelected
    }
    
    var body: some View {
    
       
                ZStack {
                    if isLoading && !isMatched {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(isSelected ? Color.black : Color.gray, lineWidth: isSelected ? 9 : 5)
                                .transition(.offset(x: randomXOffsetValue,
                                                    y: randomYOffsetValue))
                                .zIndex(0)
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white)
                                .transition(.offset(x: randomXOffsetValue,
                                y: randomYOffsetValue))
                                .zIndex(1)
                        SetCardContentWrapper(colorValue: colorValue, shapeName: shapeName, shading: shading, count: count)
                            .transition(.offset(x: randomXOffsetValue,
                                                y: randomYOffsetValue))
                            .padding(.horizontal)
                            .zIndex(2)
                        }
                                
                    }
//                    .frame(width: 150, height: 200)
                    .animation(.easeIn(duration: 0.3))
                    .onAppear {
                        self.isLoading = true
                    }
                   
                    
    
        
    }
    
    static func generateRandomNumberForOffset(uValue: Int, lValue: Int) -> CGFloat {
             
           let result = Int(arc4random_uniform(UInt32(uValue - lValue + 1))) +   lValue
           return CGFloat(result)
       }
       




struct SetCardContentWrapper: View {
    
    var colorValue : ColorValue
    var shapeName : ShapeName
    var shading : Shadings
    var count : Int
    
    var body: some View {
        VStack {
            ForEach(0..<count) { _ in
            
                
                self.getShapes(with: self.getColor(), shading: self.shading, shapeName: self.shapeName)
                        
                
                
            }
        
            
            
        }
       
    }
    
    func getColor() -> Color {
        if colorValue == ColorValue.red {
            return Color.red
        }else if colorValue == ColorValue.green {
            return Color.green
        }else {
            return Color.blue
        }
    }
    
    func getShapes(with color: Color, shading: Shadings, shapeName: ShapeName) -> some View{
        
        GeometryReader { geo in
                ZStack {
                    if shapeName == .Capsule {
                        if shading == .Fill {
                            Capsule()
                                .fill(color)
                                .frame(height: min(geo.size.width,geo.size.height) * 0.5)
                            
                        }else if shading == .Stroked {
                            Capsule()
                                .stroke(color, lineWidth: 6)
                                .frame(height: min(geo.size.width,geo.size.height) * 0.5)
                        }else {
                            Capsule()
                                .stroke(color, lineWidth: 3)
                                .frame(height: min(geo.size.width,geo.size.height) * 0.5)
                                
                            Capsule()
                                .fill(color)
                                .mask(MaskingRect().stroke(color, lineWidth: 3))
                                .frame(height: min(geo.size.width,geo.size.height) * 0.5)
                            
                        }
                    }
                
                    else if shapeName == .Circle {
                         if shading == .Fill {
                             Circle()
                                 .fill(color)
                                .frame(width: min(geo.size.width,geo.size.height) * 0.7)
                             
                         }else if shading == .Stroked {
                             Circle()
                                 .stroke(color, lineWidth: 6)
                                 .frame(width: min(geo.size.width,geo.size.height) * 0.7)
                                 
                         }else {
                             Circle()
                                 .stroke(color, lineWidth: 3)
                                 .frame(width: min(geo.size.width,geo.size.height) * 0.7)
                                 
                             Circle()
                                 .fill(color)
                                 .mask(MaskingRect().stroke(color, lineWidth: 3))
                                 .frame(width: min(geo.size.width,geo.size.height) * 0.7)
                                 
                        }
                         
                    }
                    else {
                        if shading == .Fill {
                             Rectangle()
                                 .fill(color)
                                .frame(width: min(geo.size.width,geo.size.height) * 0.7,
                                       height: min(geo.size.width,geo.size.height) * 0.7)
                             
                         }else if shading == .Stroked {
                             Rectangle()
                                 .stroke(color, lineWidth: 6)
                                 .frame(width: min(geo.size.width,geo.size.height) * 0.7,
                                 height: min(geo.size.width,geo.size.height) * 0.7)
                                 
                         }else {
                             Rectangle()
                                 .stroke(color, lineWidth: 3)
                                 .frame(width: min(geo.size.width,geo.size.height) * 0.7,
                                 height: min(geo.size.width,geo.size.height) * 0.7)
                                 
                             Rectangle()
                                 .fill(color)
                                 .mask(MaskingRect().stroke(color, lineWidth: 3))
                                 .frame(width: min(geo.size.width,geo.size.height) * 0.7,
                                 height: min(geo.size.width,geo.size.height) * 0.7)
                                 
                        }
                
                    }
                    
                }
            }
        }
    }
}


struct SetCardGameView_Previews: PreviewProvider {
    static var previews: some View {
        SetCardGameView(setGameViewModel: SetGameViewModel())
    }
}
