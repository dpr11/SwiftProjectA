//
//  AppDelegate.swift
//  SwiftProjectA
//
//  Created by DR on 18/02/2015.
//  Copyright (c) 2015 Spelga Software Limited. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    /////////////////////////////////////////////////////////////////////
    // Outlets
    /////////////////////////////////////////////////////////////////////
    
    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var button: NSButton!
    @IBOutlet weak var textView: NSTextView!
    
    /////////////////////////////////////////////////////////////////////
    // Lifecycle
    /////////////////////////////////////////////////////////////////////
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        
        println("applicationDidFinishLaunching called")
    }
    
    /////////////////////////////////////////////////////////////////////
    
    func applicationWillTerminate(aNotification: NSNotification) {
        
        println("applicationWillTerminate called")
    }
    
    /////////////////////////////////////////////////////////////////////
    
    func applicationShouldTerminateAfterLastWindowClosed(sender: NSApplication) -> Bool {
        return true;
    }
    
    
    /////////////////////////////////////////////////////////////////////
    // Actions
    /////////////////////////////////////////////////////////////////////
    
    @IBAction func userPressedButton(sender: AnyObject) {
        
        println("userPressedButton called")
        
        textView.insertText("userPressedButton\n")
    }
}

