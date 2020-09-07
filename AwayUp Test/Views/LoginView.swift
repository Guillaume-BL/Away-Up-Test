//
//  LoginView.swift
//  AwayUp Test
//
//  Created by Guillaume Bovier-Lapierre on 03/09/2020.
//  Copyright © 2020 Guillaume Bovier-Lapierre. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    let lightGreyColor = Color(red: 220.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, opacity: 1.0)
    
    @State var showAlert = false
    @State var mail: String = ""
    @State var pass: String = ""
    @State var sendToView = false
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
                VStack (alignment: .center, spacing: 30) {
                    Text("Away Up")
                        .font(.largeTitle).foregroundColor(Color.white)
                        .padding([.bottom], 40)
                        .shadow(radius: 10.0, x: 20, y: 10)
                    
                    Image("awayup-logo-color")
                        .resizable()
                        .frame(width: 250, height: 250)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 10.0, x: 20, y: 10)
                        .padding(.bottom, 50)
                    
                    VStack (alignment: .leading, spacing: 15) {
                        TextField("Email", text: $mail)
                            .padding()
                            .background(lightGreyColor)
                            .cornerRadius(20.0)
                            .keyboardType(UIKeyboardType.emailAddress)
                            .autocapitalization(UITextAutocapitalizationType.none)
                        
                        SecureField("Password", text: $pass)
                            .padding()
                            .background(lightGreyColor)
                            .cornerRadius(20.0)
                    }.padding([.leading, .trailing], 27.5)
                    
                    
                    Button(action: {
                        if (self.mail.isEmpty || self.pass.isEmpty) {
                            self.showAlert = true
                        }
                        else {
                            if (Requests().userAuth(mail: self.mail, pass: self.pass)) {
                                self.sendToView = true
                            }
                            else {
                                self.showAlert = true
                            }
                        }
                    })
                    {
                        Text("Sign In")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color.green)
                            .cornerRadius(15.0)
                            .shadow(radius: 10.0, x: 20, y: 10)
                    }.padding(.top, 50)
                    NavigationLink(destination: InfoView(), isActive: self.$sendToView) {
                        EmptyView()
                    }
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Error"), message: Text("Invalid mail or password."))
                }
            }
            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
