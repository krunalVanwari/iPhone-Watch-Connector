//
//  ShowData.swift
//  iOSApp
//
//  Created by Qurious Click on 31/03/22.
//

import SwiftUI

struct ShowData: View {
    
    @Binding private var users:[User] {
        didSet {
            print("didSet in show data")
        }
    }
    
    init(users:Binding<[User]>) {
        self._users = users
    }
    
    var body: some View {
        ScrollView {
            
            ForEach(users, id: \.name) { user in
                HStack {
                
                    Text("User \nname : \(user.name)\nemail : \(user.eMail)")
                    .lineLimit(3)
                    .padding()
                 
                    Spacer()
                    
                }
            }
        }
    }
}

