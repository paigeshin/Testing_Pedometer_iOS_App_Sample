//
//  MockPedometer.swift
//  PedometerAppTests
//
//  Created by paige shin on 2022/07/14.
//  Copyright © 2022 Mohammad Azam. All rights reserved.
//

import Foundation
@testable import PedometerApp
import CoreMotion

class MockPedometer: Pedometer {
    
    var error: Error?
    var pedometerAvailable: Bool = true
    var permissionDeclined: Bool = false 
    private(set) var started: Bool = false
    
    var updateBlock: ((Error?) -> Void)?
    var dataBlock: ((PedometerData?, Error?) -> Void)?
    
    static let notAuthorizedError = NSError(domain: CMErrorDomain, code: Int(CMErrorMotionActivityNotAuthorized.rawValue), userInfo: nil)

    func sendData(_ data: PedometerData) {
        self.dataBlock?(data, error)
    }
    
    func start(dataUpdates: @escaping (PedometerData?, Error?) -> Void, eventUpdates: @escaping (Error?) -> Void) {
        self.started = true
        self.updateBlock = eventUpdates
        self.dataBlock = dataUpdates
        DispatchQueue.global(qos: .default).async {
            self.updateBlock?(self.error)
        }
    }
    
}
