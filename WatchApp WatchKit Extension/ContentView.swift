//
//  ContentView.swift
//  WatchApp WatchKit Extension
//
//  Created by Qurious Click on 31/03/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var connector = PhoneConnector.shared
    
    @State private var name:String = ""
    @State private var email:String = ""
            
    
    var body: some View {
        List {
            NavigationLink("send data to phone") {
                SendData(name: $name, email: $email) {
                    PhoneConnector.shared.sendDataToPhone(User(name: name, eMail: email))
                }
            }
            
            NavigationLink("see received data") {
                ShowData(users: $connector.users)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
