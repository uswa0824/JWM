//
//  Item.swift
//  JWM
//
//  Created by Jeremiah Morris on 7/5/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
