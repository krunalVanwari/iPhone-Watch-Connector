//
//  ContentView.swift
//  iOSApp
//
//  Created by Qurious Click on 31/03/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var connector = WatchConnector.shared
    
    @State private var name:String = ""
    @State private var email:String = ""
            
    var body: some View {
        
        VStack {
            
            Text("Send Data To Watch")
                .font(.largeTitle)
            
            SendData(name: $name, email: $email) {
                WatchConnector.shared.sendDataToWatch(User(name: name, eMail: email))
            }
            
            Color.black.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 2, alignment: .center)
            
            Text("Data received from watch")
                .font(.largeTitle)
            
            ShowData(users: $connector.users)
            
            Spacer()
        
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
