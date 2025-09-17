//
//  TimerView.swift
//  WidgetDynamicIsland
//
//  Created by Devesh Pandey on 09/09/25.
//


// 2) SwiftUI view that observes the ViewModel
import SwiftUI

@available(iOS 16.1, *)
struct TimerView: View {
    @ObservedObject var viewModel: TimerViewModel

    var body: some View {
        VStack{
            Text("Time it up!")
                .font(.largeTitle)
            Spacer()
            if(viewModel.isTracking){
                HStack{
                    Text("Seconds:")
                        .font(.title)
                    Text(viewModel.startTime ?? .now, style: .relative)
                        .font(.title)
                }
            }
            HStack {
                ZStack {
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
                    .frame(width: 200,height: 200)
                    
                    Text(viewModel.isTracking ? "Stop Timer" : "Start Timer")
                        .font(.title2)
                    
                    
                }
                .onTapGesture {
                    viewModel.startStopBtnTap()
                }
            }
            Spacer()
        }
        .padding()
    }
}
