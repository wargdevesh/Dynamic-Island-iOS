//
//  TimeAttribute.swift
//  WidgetDynamicIsland
//
//  Created by Devesh Pandey on 08/09/25.
//

import Foundation
import ActivityKit

struct TimeAttribute: ActivityAttributes {
    typealias TimeStatus = ContentState
    
    public struct ContentState : Codable,Hashable {
        var startTime: Date
    }
    
    
}
