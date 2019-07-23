//
//  AnimationGroup.swift
//  MBSwift
//
//  Created by Сергей Сивагин on 23/07/2019.
//  Copyright © 2019 MBicycle. All rights reserved.
//

import Foundation

struct AnimationGroupTask {
    
    let duration: TimeInterval
    let delay: TimeInterval?
    let options: UIView.AnimationOptions?
    let animations: () -> Void
    
    init(duration: TimeInterval, delay: TimeInterval, options: UIView.AnimationOptions, animations: () -> Void) {
        self.duration = duration
        self.delay = delay
        self.options = options
        self.animations = animations
    }
    
    init(duration: TimeInterval, animations: () -> Void) {
        self.duration = duration
        self.delay = nil
        self.options = nil
        self.animations = animations
    }
}
