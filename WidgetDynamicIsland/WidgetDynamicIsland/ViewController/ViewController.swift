//
//  ViewController.swift
//  WidgetDynamicIsland
//
//  Created by Devesh Pandey on 08/09/25.
//

import UIKit
import ActivityKit
import SwiftUI

@available(iOS 16.1, *)
class TimeViewController: UIViewController {
    
    private let timerVM: TimerViewModel
     private lazy var hostingController: UIHostingController<TimerView> = {
         UIHostingController(rootView: TimerView(viewModel: timerVM))
     }()
    
    init(timerVM: TimerViewModel) {
        self.timerVM = timerVM
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     override func viewDidLoad() {
         super.viewDidLoad()
         view.backgroundColor = .systemBackground
         setUpSwiftUIView()
         // Create SwiftUI view with the ViewModel (UIKit owns VM)
         
     }
    
    func setUpSwiftUIView() {
        let swiftUIView = TimerView(viewModel: timerVM)
        hostingController = UIHostingController(rootView: swiftUIView)

        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        hostingController.didMove(toParent: self)
    }

     override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
         //timerVM.start()     // start when VC appears
     }

     override func viewWillDisappear(_ animated: Bool) {
         super.viewWillDisappear(animated)
       //  timerVM.stop()      // stop when VC disappears
     }
    
    
    

}

