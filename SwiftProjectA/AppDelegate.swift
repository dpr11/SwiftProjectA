//
//  AppDelegate.swift
//  SwiftProjectA
//
//  Created by DR on 18/02/2015.
//  Copyright (c) 2015 Spelga Software Limited. All rights reserved.
//

import Cocoa
import Alamofire

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    /////////////////////////////////////////////////////////////////////
    // Outlets
    /////////////////////////////////////////////////////////////////////
    
    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var button: NSButton!
    @IBOutlet var textView: NSTextView!         // Textviews cannot be weak-linked

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
        
        // Set the textview contents so we know something is happenning
        let attribString = NSAttributedString(string: "Retrieving ...", attributes: nil)
        self.textView.textStorage?.setAttributedString(attribString)
        
        // Async call
        Alamofire.request(.GET, "http://www.spelgasoftware.co.uk/PhoneLog/home.html")        // "http://127.0.0.1:9876/ts?wsdl"
            .responseString { (request, response, body, error) in
                
                // Concatenate the response components
                var contents = ""
                contents += "Request:\n\n\(request)\n\n"
                contents += "========== ========== ========== ==========\n\n"
                if (response != nil) {
                    contents += "Response:\n\n\(response!)\n\n"
                } else {
                    contents += "Response: <nil>\n\n"
                }
                contents += "========== ========== ========== ==========\n\n"
                if (error != nil) {
                    contents += "Error:\n\n\(error!)\n\n"
                } else {
                    contents += "Error: <nil>\n\n"
                }
                contents += "========== ========== ========== ==========\n\n"
                if (body != nil) {
                    contents += "Body:\n\n\(body!)\n\n"
                } else {
                    contents += "Body: <nil>\n\n"
                }
                
                // Log to stdout
                println(contents)
                
                // Set the textview's contents
                let attribString = NSAttributedString(string: contents, attributes: nil)
                self.textView.textStorage?.setAttributedString(attribString)
        }
    }
}

