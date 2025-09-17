//
//  TimerViewModel.swift
//  WidgetDynamicIsland
//
//  Created by Devesh Pandey on 09/09/25.
//


import UIKit
import SwiftUI
import Combine
import ActivityKit

// 1) ViewModel (UIKit owns it)
@available(iOS 16.1, *)
final class TimerViewModel: ObservableObject {
  //  @Published private(set) var seconds: Int = 0
   @Published private(set) var isTracking = false
   @Published private(set) var startTime : Date? = nil
   private var activity: Activity<TimeAttribute>? = nil
//    private var timer: Timer?
//    private let interval: TimeInterval

//    init(interval: TimeInterval = 1.0) {
//        self.interval = interval
//    }

    func startStopBtnTap(){
        isTracking ? stop() : start()
    }
    
    func start() {
        // Ensure we don't start twice
        isTracking.toggle()
        startTime = .now
        let attribute = TimeAttribute()
        let state = TimeAttribute.ContentState(startTime: .now)
        activity = try? Activity<TimeAttribute>.request(attributes: attribute,contentState: state, pushType: nil)
        
    }

    func stop() {
        isTracking.toggle()
        guard let startTime else {
            return
        }
        
        let state = TimeAttribute.ContentState(startTime: startTime)
        
        Task {
            await activity?.end(using: state, dismissalPolicy: .immediate)
        }
        
        self.startTime  = nil
    }

    deinit {
        stop()
    }
}
