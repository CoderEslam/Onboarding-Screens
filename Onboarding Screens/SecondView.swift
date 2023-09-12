//
//  SecondView.swift
//  Onboarding Screens
//
//  Created by Eslam Ghazy on 5/9/23.
//

import SwiftUI

struct SecondView: View {
    @State var isExpanded : Bool = false
    @State var startTyping : Bool = false
    @State var showtext : Bool = false
    @Binding var showNextView : Bool
    var body: some View {
        ZStack {
            GeoView(isExpanded: $isExpanded, startTyping: $startTyping, showtext: $showtext, color: "sview",showNextView: $showNextView)
            VStack(alignment: .leading){
                Text("Swift ui \n Framwork")
                    .foregroundColor(.black)
                    .font(.system(size: 50)).bold()
                TypingEffect(fullText: "Swift UI helps you build gread looking  app across all Apple platform with the power of Swift - surprisingly little code . You can bring even better...", isExpanded: $startTyping)
            }
            .opacity(isExpanded ? 1 : 0)
            .scaleEffect(isExpanded ? 1 : 0)
            .offset(x:showtext ? 0 : UIScreen.main.bounds.width)
        }
        .ignoresSafeArea()
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView(showNextView: .constant(false))
    }
}
