//
//  Pedometer.swift
//  PedometerApp
//
//  Created by paige shin on 2022/07/14.
//  Copyright © 2022 Mohammad Azam. All rights reserved.
//

import Foundation
import CoreMotion

protocol Pedometer {
    var pedometerAvailable: Bool { get }
    var permissionDeclined: Bool { get }
    func start(dataUpdates: @escaping(PedometerData?, Error?) -> Void, eventUpdates: @escaping(Error?) -> Void)
}

protocol PedometerData {
    var steps: Int { get }
    var distanceTravelled: Double { get }
}

