//
//  ContentView.swift
//  AwayUp Test
//
//  Created by Guillaume Bovier-Lapierre on 03/09/2020.
//  Copyright © 2020 Guillaume Bovier-Lapierre. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var logged = Requests().userLogged
    
    var body: some View {
        Text("Hello, World!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
