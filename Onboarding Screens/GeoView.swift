//
//  GeoView.swift
//  Onboarding Screens
//
//  Created by Eslam Ghazy on 5/9/23.
//

import SwiftUI

struct GeoView: View {
    
    // Binding variable - thes allow the state to be manged outside this view but also allow this view to update the state
    @Binding var isExpanded : Bool // Determines if the view is expanded or not
    @Binding var startTyping : Bool // Determines if the typing effect should start
    @Binding var showtext :Bool // Determines if the text should be shown or not
    
    // Regular variables  - Used to modify the appearance and behavior of the view
    var color :String // Color for the circular view
    var text :String  = "Next" // Text displayed on the button
    var showNextView :Binding<Bool>? // Binding to determin if the next view should be shown . Optional since it's not always required
    
    // Variable to determin if the view should toggle between expande and collapsed to states on tap . Defauld is true.
    var shouldToogleExpand :Bool = true

    var body: some View {
        // GeometryReader -> to read dimantions of
        GeometryReader{ geometry in
            
            ZStack{
                Circle().foregroundColor(Color(color))
                    .frame(width: isExpanded ? max(geometry.size.width , geometry.size.height) * 1.5 : 200 ,
                           height:  isExpanded ? max(geometry.size.width ,geometry.size.height) * 1.5 : 200)
            
                if !isExpanded {
                    HStack{
                        Text(text)
                        Image(systemName: "arrow.right")
                    }
                    .bold()
                    .font(.system(size: 20))
                    .foregroundColor(.black)
                    
                } else {
//                    VStack{
//                        Text("\(max(geometry.size.width , geometry.size.height))")
//                        Text("\(geometry.size.width )")
//                        Text("\(geometry.size.height)")
//                    }
                    
                }
                
                
            }.frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .bottomTrailing)
                .offset(x:isExpanded ? -250 : 40 , y: isExpanded ? -250 : 20) // offset to adjust postion
            

            
        }
        .onTapGesture {
            // Anmate the view's state changes
            withAnimation{
                // Toggle the isExpanded state base on the shouleToggleExpand variable
                if shouldToogleExpand {
                    isExpanded.toggle()
                }else{
                    isExpanded = true
                }
                // Toggle other state relate to display and animation
                
                showtext.toggle()
                
                startTyping = true
                //if threr's a binding for showing new view , toggle ita value after a brief delay
                
                if let showNextViewBinding = showNextView {
                    // this working after now + 0.1
                    // Schedules a work item for execution after the specified time, and returns immediately.
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
                        showNextViewBinding.wrappedValue.toggle()
                    }
                }
                
            }
        }
    }
}


