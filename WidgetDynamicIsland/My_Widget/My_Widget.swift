//
//  My_Widget.swift
//  My_Widget
//
//  Created by Devesh Pandey on 08/09/25.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct  My_Widget: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: TimeAttribute.self) { context in
            TimeTrackingWidgetView(context: context)
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.center) {
                    TimeTrackingWidgetView(context: context)
                }
            } compactLeading: {
                Image(systemName: "timer")
            } compactTrailing: {
                Text(context.state.startTime, style: .relative)
            } minimal: {
                Text("Minimal")
            }

        }

    }
}

struct TimeTrackingWidgetView: View {
    let context: ActivityViewContext<TimeAttribute>
    var body: some View {
        HStack{
            Circle()
                .fill(
                LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.95, green: 0.38, blue: 0.38),  // #F26161 (Red)
                    Color(red: 0.68, green: 0.42, blue: 0.85),  // #AD6BDB (Purple)
                    Color(red: 0.27, green: 0.54, blue: 0.93)   // #458AED (Blue)
                ]),
                startPoint: .leading,
                endPoint: .trailing
            )
            )
            .frame(width: 50,height: 50)
            .padding(.leading, 20)
            Text("Timer")
                .padding(.trailing, 20)
            Text(context.state.startTime, style: .relative)
        }
    }
}
