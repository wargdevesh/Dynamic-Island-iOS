//
//  My_WidgetLiveActivity.swift
//  My_Widget
//
//  Created by Devesh Pandey on 08/09/25.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct My_WidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct My_WidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: My_WidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension My_WidgetAttributes {
    fileprivate static var preview: My_WidgetAttributes {
        My_WidgetAttributes(name: "World")
    }
}

extension My_WidgetAttributes.ContentState {
    fileprivate static var smiley: My_WidgetAttributes.ContentState {
        My_WidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: My_WidgetAttributes.ContentState {
         My_WidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: My_WidgetAttributes.preview) {
   My_WidgetLiveActivity()
} contentStates: {
    My_WidgetAttributes.ContentState.smiley
    My_WidgetAttributes.ContentState.starEyes
}
