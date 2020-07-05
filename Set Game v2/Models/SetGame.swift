//
//  SetGame.swift
//  Set Game v2
//
//  Created by sriram on 04/07/20.
//  Copyright © 2020 sriram. All rights reserved.
//

import Foundation


struct SetGame {
    
    var deck : Array<SetCard> = []
    var playingTwelveDeck : Array<SetCard> = []
    
    
    var removedCardIndexArray : Int = 0
    
    
    
  
    
    
   private var isFaceUpCardCount = 0
    
    init(deck: Array<SetCard>){
      
        self.deck = deck
       
                 for index in 0..<12 {
                    var setCard = self.deck.remove(at: 0)
                    setCard.position = index
                    self.playingTwelveDeck.append(setCard)
                 }
             
             
             print("new deck count: \(deck.count)")
             
        
       
             
    }
    
  
    
    mutating func addACardToPlayingDeck() {
       
            var setCard = self.deck.remove(at: 0)
            setCard.position = removedCardIndexArray
            self.playingTwelveDeck.insert(setCard, at: setCard.position)
            
        
    }
    
    mutating func clearAllSelected() {
        for index in playingTwelveDeck.indices {
            playingTwelveDeck[index].isSelected = false
        }
    }
 
    
  
    mutating func choose(setCard: SetCard) {
        if let index = playingTwelveDeck.firstIndex(of: setCard) {
            if isFaceUpCardCount < 3 {
                if playingTwelveDeck[index].isSelected == false {
                    playingTwelveDeck[index].isSelected = true
                    isFaceUpCardCount += 1
                }else {
                    playingTwelveDeck[index].isSelected = false
                    isFaceUpCardCount -= 1
                }
            }
            else if !playingTwelveDeck[index].isSelected {
                playingTwelveDeck[index].isSelected = true
                isFaceUpCardCount += 1
                
            }
            print("isFaceupCount: \(isFaceUpCardCount)")
        }
        if isFaceUpCardCount == 3 {
            var selectedCardsArray : Array<SetCard> = []
            for index in playingTwelveDeck.indices {
                if playingTwelveDeck[index].isSelected == true {
                    selectedCardsArray.append(playingTwelveDeck[index])
                    print("selectedArray: \(selectedCardsArray.count)")
                }
            }
            
            
            if ((selectedCardsArray[0].count == selectedCardsArray[1].count) && (selectedCardsArray[1].count == selectedCardsArray[2].count)) || ((selectedCardsArray[0].count != selectedCardsArray[1].count) && (selectedCardsArray[1].count != selectedCardsArray[2].count) && (selectedCardsArray[0].count != selectedCardsArray[2].count)){
                print("passed count")
                
                if ((selectedCardsArray[0].shapeName == selectedCardsArray[1].shapeName) && (selectedCardsArray[1].shapeName == selectedCardsArray[2].shapeName)) || ((selectedCardsArray[0].shapeName != selectedCardsArray[1].shapeName) && (selectedCardsArray[1].shapeName != selectedCardsArray[2].shapeName) && (selectedCardsArray[0].shapeName != selectedCardsArray[2].shapeName)) {
                    
                    print("passed shapName")
                    
                        if ((selectedCardsArray[0].color == selectedCardsArray[1].color) && (selectedCardsArray[1].color == selectedCardsArray[2].color)) || ((selectedCardsArray[0].color != selectedCardsArray[1].color) && (selectedCardsArray[1].color != selectedCardsArray[2].color) && (selectedCardsArray[0].color != selectedCardsArray[2].color)) {
                            
                            print("passed color")
                            
                            if ((selectedCardsArray[0].shading == selectedCardsArray[1].shading) && (selectedCardsArray[1].shading == selectedCardsArray[2].shading)) || ((selectedCardsArray[0].shading != selectedCardsArray[1].shading) && (selectedCardsArray[1].shading != selectedCardsArray[2].shading) && (selectedCardsArray[0].shading != selectedCardsArray[2].shading)) {
                                                                    
                                print("passed shading")
                                for index in 0..<3 {
                                    
                                    selectedCardsArray[index].isMatched = true
                                }
                                
                                
                                                              for playingTwelveDeckIndex in self.playingTwelveDeck.indices {
                                                                  for selectedCardIndex in selectedCardsArray.indices {
                                                                      if selectedCardsArray[selectedCardIndex].id == playingTwelveDeck[playingTwelveDeckIndex].id {
                                                                          print("card Value : \(playingTwelveDeck[playingTwelveDeckIndex])")
                                                                          playingTwelveDeck[playingTwelveDeckIndex].isMatched = true
                                                                        
                                                                        
                                                        removedCardIndexArray = playingTwelveDeck[playingTwelveDeckIndex].position
                                                                        
                                                                            playingTwelveDeck.remove(at: playingTwelveDeckIndex)
                                                                            addACardToPlayingDeck()
                                                                            print("added new card to playingDeck")
                                                                      }
                                                                  }
                                                              }
                                
                                isFaceUpCardCount = 0
                                
                                
                                }else {
                                clearAllSelected()
                                isFaceUpCardCount = 0
                                        return
                                
                            }
                            
                            
                            
                        }else {
                            clearAllSelected()
                            isFaceUpCardCount = 0
                            return
                            
                    }
                    
                    
                }else {
                    clearAllSelected()
                    isFaceUpCardCount = 0
                    return
                    
                    
                }
        }else {
                clearAllSelected()
                isFaceUpCardCount = 0
                return
                
            }
    }
       
}
 

    
    
    struct SetCard : Identifiable {
      
        
        var color : ColorValue
        var shapeName : ShapeName
        var shading : Shadings
        var count : Int
        var isSelected = false
        var isMatched = false
        var position : Int
        var id = UUID()
        
        
    }
}
