//
//  WatchConnector.swift
//  iOSApp
//
//  Created by Qurious Click on 31/03/22.
//

import Foundation
import WatchConnectivity

class WatchConnector:NSObject,ObservableObject {
    
    // public variables
    
    static let shared = WatchConnector()
    
    public var session = WCSession.default
    
    @Published var users:[User] = []
    
    private override init(){
        super.init()
        if WCSession.isSupported() {
            session.delegate = self
            session.activate()
        }
    }
}

// MARK: - WCSessionDelegate methods
extension WatchConnector:WCSessionDelegate {
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        session.activate()
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        session.activate()
    }

    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        if let error = error {
            print("session activation failed with error: \(error.localizedDescription)")
            return
        }
    }
    
    func session(_ session: WCSession, didReceiveUserInfo userInfo: [String : Any] = [:]) {
        dataReceivedFromWatch(userInfo)
    }
    
    // MARK: use this for testing in simulator
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        dataReceivedFromWatch(message)
    }
    
    
}

// MARK: - send data to watch
extension WatchConnector {
    
    public func sendDataToWatch(_ user:User) {
        let dict:[String:Any] = ["data":user.encodeIt()]
        
        //session.transferUserInfo(dict)
        // for testing in simulator we use
        session.sendMessage(dict, replyHandler: nil)
    }
    
}

// MARK: - receive data
extension WatchConnector {
    
    public func dataReceivedFromWatch(_ info:[String:Any]) {
        let data:Data = info["data"] as! Data
        let user = User.decodeIt(data)
        DispatchQueue.main.async {
            self.users.append(user)
        }
    }
    
}
