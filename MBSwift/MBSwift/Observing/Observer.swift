//
//  Observer.swift
//  MBSwift
//
//  Created by Siarhei on 7/20/19.
//  Copyright © 2019 MBicycle. All rights reserved.
//

import Foundation

struct Observer<T> {
    var handler: OnValueChanged<T>?
    var queue: DispatchQueue
}
