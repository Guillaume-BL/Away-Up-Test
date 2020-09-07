//
//  InfoView.swift
//  AwayUp Test
//
//  Created by Guillaume Bovier-Lapierre on 06/09/2020.
//  Copyright © 2020 Guillaume Bovier-Lapierre. All rights reserved.
//

import SwiftUI

struct InfoView: View {
    
    @Environment(\.presentationMode) var presentation
    // Get u info
    init() {
        Requests().userInfos()
        print("User infos")
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack (alignment: .center, spacing: 30) {
                
                Text("User infos")
                    .font(.largeTitle).foregroundColor(Color.white)
                    .padding([.bottom], 40)
                    .shadow(radius: 10.0, x: 20, y: 10)
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempus massa ipsum. Nam semper, dolor ut semper efficitur, purus turpis facilisis purus, in consectetur nunc metus eu metus. Donec nec maximus quam, eget eleifend lacus. Proin eu viverra ante, id ornare dui. Maecenas a purus lobortis, efficitur sapien vitae, lobortis magna. Nullam tempor magna pharetra ipsum congue, sed faucibus tellus egestas. Ut sagittis tristique tellus, non tempus dolor finibus pulvinar. Aenean tristique efficitur ante et porttitor. Fusce id ultricies ligula. Aliquam nibh urna, gravida eget quam eu, pretium varius neque. Nullam at elit consequat, aliquam magna sed, gravida ante. Donec varius nulla quis elementum accumsan. Nunc sed nunc quis purus semper dictum et a erat.")
                    .foregroundColor(Color.white)
                    .padding([.top, .bottom], 40)
                    .padding([.leading, .trailing], 27.5)
                    .shadow(radius: 10.0, x: 20, y: 10)
                Button(action: {
                    self.presentation.wrappedValue.dismiss()
                })
                {
                    Text("Log out")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.red)
                        .cornerRadius(15.0)
                        .shadow(radius: 10.0, x: 20, y: 10)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
