//
//  Model.swift
//  iOSApp
//
//  Created by Qurious Click on 31/03/22.
//

import Foundation

struct User:Codable {
    
    let name:String
    let eMail:String
    
    func encodeIt() -> Data {
        let data = try! PropertyListEncoder.init().encode(self)
            return data
    }
    
    static func decodeIt(_ data:Data) -> User {
        let user = try! PropertyListDecoder.init().decode(User.self, from: data)
        return user
    }
    
}
