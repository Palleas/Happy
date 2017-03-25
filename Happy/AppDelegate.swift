//
//  AppDelegate.swift
//  Happy
//
//  Created by Romain Pouclet on 2017-03-24.
//  Copyright © 2017 Perfectly-Cooked. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let id = ProcessInfo.processInfo.environment["GOOGLE_CLIENT_ID"]!
        let secret = ProcessInfo.processInfo.environment["GOOGLE_CLIENT_SECRET"]!
        let whoAmI = Credentials(clientId: id, clientSecret: secret)
        
        AuthController(credentials: whoAmI).open()
        
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

