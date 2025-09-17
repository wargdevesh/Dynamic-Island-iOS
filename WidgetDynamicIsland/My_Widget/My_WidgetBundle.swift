//
//  My_WidgetBundle.swift
//  My_Widget
//
//  Created by Devesh Pandey on 08/09/25.
//

import WidgetKit
import SwiftUI

@main
struct My_WidgetBundle: WidgetBundle {
    var body: some Widget {
        My_Widget()
        My_WidgetControl()
        My_WidgetLiveActivity()
    }
}
