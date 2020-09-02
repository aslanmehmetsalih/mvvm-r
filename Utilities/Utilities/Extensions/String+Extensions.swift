//
//  String+Extensions.swift
//  Utilities
//
//  Created by Mehmet Salih Aslan on 2.09.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

import Foundation

public extension String {
    
    var trim: String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
}
