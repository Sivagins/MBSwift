//
//  UIView+AnimateGroup.swift
//  MBSwift
//
//  Created by Сергей Сивагин on 23/07/2019.
//  Copyright © 2019 MBicycle. All rights reserved.
//

import Foundation

extension UIView {
    
    static func animate(onCompleted: @escaping () -> Void, tasks: AnimationGroupTask...) {
        let group = DispatchGroup()
        group.notify(queue: .main, execute: { onCompleted() })
        tasks.forEach { task in
            group.enter()
            if let delay = task.delay, let options = task.options {
                UIView.animate(withDuration: task.duration, delay: delay, options: options, animations: task.animations) { _ in
                    group.leave()
                }
            } else {
                UIView.animate(withDuration: task.duration, animations: task.animations, completion: { _ in
                    group.leave()
                })
            }
        }
    }
}
