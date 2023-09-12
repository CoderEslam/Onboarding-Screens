//
//  HomeView.swift
//  Onboarding Screens
//
//  Created by Eslam Ghazy on 5/9/23.
//

import SwiftUI

struct HomeView: View {
    @State var isExpanded : Bool = false
    @State var startTyping : Bool = false
    @State var showtext : Bool = false
    @Binding var showNextView : Bool

    var body: some View {
        ZStack {
            GeoView(isExpanded: $isExpanded, startTyping: $startTyping, showtext: $showtext, color: "tview",text: "START", shouldToogleExpand: false)
            VStack(alignment: .leading){
                Text("Swift ui \n Framwork")
                    .foregroundColor(.black)
                    .font(.system(size: 50)).bold()
            }
            .opacity(isExpanded ? 1 : 0)
            .scaleEffect(isExpanded ? 1 : 0)
            .offset(x:isExpanded ? 0 : UIScreen.main.bounds.width)
        }
        .ignoresSafeArea()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showNextView: .constant(false))
    }
}
    
