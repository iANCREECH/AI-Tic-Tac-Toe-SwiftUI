//
//  AboutView.swift
//  T3 (Tic-Tac-Toe)
//
//  Copyright © 2020 Ian Creech. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    
    var body: some View {
        ZStack {
            
            Color.offWhite.edgesIgnoringSafeArea(.all)
            
            VStack {
                
                VStack(alignment: .leading) {
                    
                    Text("About the App")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                    
                    Text("What is this for?")
                        .font(.subheadline)
                        .fontWeight(.thin)
                        .foregroundColor(Color.black)
                }
                .background(RectangleCard(w: 250, h: 150, colorFill: .offWhite),alignment: .center)
                .padding(.bottom, 100)
                
                //Spacer(minLength: 0)
                
                Text("This app started off as a project for my \"Senior Project\" class at my university. I decided to make it a little nicer as I was first learning Swift and SwiftUI. I tried out neumorphic design and played around with other SwiftUI stuff. I did this for pure enjoyment and for me a way to learn some basics.")
                    .font(.system(size: 12))
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .lineSpacing(10)
                    .padding(.all)
                
                HStack(spacing: 15) {
                    
                    Image("X").resizable().frame(width: 15, height: 15, alignment: .center)
                    Image("O").resizable().frame(width: 15, height: 15, alignment: .center)
                    Image("X").resizable().frame(width: 15, height: 15, alignment: .center)
                    
                }
                
                Text("For anyone else wanting to know a way to make a tic-tac-toe app using SwiftUI, this is for you. When making the app for my class, it was hard to find informtion for some of the things I was wanting to do (originaly started this when SwiftUI first came out). So, if by some chance you found this, here you go! Thanks!")
                    .font(.system(size: 12))
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .lineSpacing(10)
                    .padding(.all)
            }
            .padding()
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
