//
//  MockData.swift
//  PedometerAppTests
//
//  Created by paige shin on 2022/07/14.
//  Copyright © 2022 Mohammad Azam. All rights reserved.
//

import Foundation
@testable import PedometerApp

struct MockData: PedometerData {
    let steps: Int
    let distanceTravelled: Double
}
