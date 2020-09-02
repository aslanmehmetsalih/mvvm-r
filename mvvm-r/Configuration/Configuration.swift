//
//  Configuration.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 2.09.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

//swiftlint:disable fatal_error
class Configuration {
    
    static let shared = Configuration()
    
    private var dictionary: NSMutableDictionary
    
    var omdbApiKey: String {
        guard let key = dictionary["omdbApiKey"] as? String else {
            fatalError("omdbApiKey can not be found. Please check your configuration plist file.")
        }
        return key
    }
    
    private init() {
        #if DEBUG
            let file = Bundle.main.path(forResource: "Configuration-Debug", ofType: "plist")!
        #else
            let file = Bundle.main.path(forResource: "Configuration", ofType: "plist")!
        #endif
        self.dictionary = NSMutableDictionary(contentsOfFile: file)!
    }
    
}
//swiftlint:enable fatal_error
