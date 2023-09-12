//
//  TypingEffect.swift
//  Onboarding Screens
//
//  Created by Eslam Ghazy on 5/9/23.
//

import SwiftUI

struct TypingEffect: View {
    @State private var displayedText = ""
    var fullText : String
    @State private var currentCharaterIndex :String.Index!
    @Binding var isExpanded :Bool
    
    var body: some View {
        VStack{
            Text(displayedText).font(.custom("Courier", size: 15))
                .foregroundColor(.black)
                .frame(width: 380,height: 150,alignment: .topLeading)
        }
        // this excute when something change
        .onChange(of: isExpanded) { newValue in
            if newValue {
                startTypingEffect()
            }
        }
    }
    // this function to read line of word index bty index and appent to displayedText and at end on last Charater of line will finish timer 
    func startTypingEffect() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
            currentCharaterIndex = fullText.startIndex
            Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true){ timer in
                displayedText.append(fullText[currentCharaterIndex])
                currentCharaterIndex = fullText.index(after: currentCharaterIndex)
                if currentCharaterIndex == fullText.endIndex {
                    timer.invalidate()
                }
            }
        }
    }
}

struct TypingEffect_Previews: PreviewProvider {
    static var previews: some View {
        TypingEffect(fullText: "", isExpanded: .constant(false))
    }
}
