//
//  SendData.swift
//  iOSApp
//
//  Created by Qurious Click on 31/03/22.
//

import SwiftUI

struct SendData: View {
    
    @Binding private var name:String
    @Binding private var email:String
        
    var action:() -> ()
    
    init(name:Binding<String>,email:Binding<String>,action:@escaping () -> ()) {
        self._name = name
        self._email = email
        self.action = action
    }
    
    var body: some View {
        
        VStack {
            
            TextField("name", text: $name)
                .padding(.leading)
            
            TextField("email", text: $email)
                .padding(.leading)
                            
                
                Button("Send") {
                    action()
                }
                .padding(.leading)
                
            
        }
    }
}
