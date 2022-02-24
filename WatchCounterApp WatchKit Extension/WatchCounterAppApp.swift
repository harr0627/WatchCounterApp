//
//  WatchCounterAppApp.swift
//  WatchCounterApp WatchKit Extension
//
//  Created by kelsey harrison on 2022-02-24.
//

import SwiftUI

@main
struct WatchCounterAppApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
