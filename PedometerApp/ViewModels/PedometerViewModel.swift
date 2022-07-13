//
//  PedometerViewModel.swift
//  PedometerApp
//
//  Created by paige shin on 2022/07/14.
//  Copyright © 2022 Mohammad Azam. All rights reserved.
//

import Foundation
import CoreMotion

enum AppState {
    case notStarted
    case inProgress
    case notAuthorized
}

class PedometerViewModel {
    
    var steps: Int = 0
    var distanceTravelled: Double = 0.0 
    var pedometer: Pedometer
    var appState: AppState = .notStarted
    
    init(pedometer: Pedometer) {
        self.pedometer = pedometer
    }
    
    func startPedomter() {
        guard self.pedometer.pedometerAvailable else {
            self.appState = .notStarted
            return 
        }
        guard !self.pedometer.permissionDeclined else {
            self.appState = .notStarted
            return 
        }
        self.appState = .inProgress
        self.pedometer.start { data, error in
            
            if let data = data {
                self.steps = data.steps
                self.distanceTravelled = data.distanceTravelled
            }
            
        } eventUpdates: { error in
            if let error = error {
                let nsError = error as NSError
                if nsError.domain == CMErrorDomain && nsError.code == CMErrorMotionActivityNotAuthorized.rawValue {
                    self.appState = .notAuthorized
                }
            }
        }
    }
    
}
