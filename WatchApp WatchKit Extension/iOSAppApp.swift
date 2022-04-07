//
//  iOSAppApp.swift
//  WatchApp WatchKit Extension
//
//  Created by Qurious Click on 31/03/22.
//

import SwiftUI

@main
struct iOSAppApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
