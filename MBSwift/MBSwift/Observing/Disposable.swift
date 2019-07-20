//
//  Dispose.swift
//  MBSwift
//
//  Created by Siarhei on 7/20/19.
//  Copyright © 2019 MBicycle. All rights reserved.
//

import Foundation

typealias Dispose = (() -> Void)

public class Disposable {
    
    let dispose: Dispose
    
    init(dispose: @escaping Dispose) {
        self.dispose = dispose
    }
    
    deinit {
        dispose()
    }
}
