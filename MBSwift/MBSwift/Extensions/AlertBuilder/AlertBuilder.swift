//
//  AlertBuilder.swift
//  MBSwift
//
//  Created by Siarhei on 7/20/19.
//  Copyright © 2019 MBicycle. All rights reserved.
//

import Foundation

public class AlertBuilder {
    
    private let dialog: UIAlertController!
    
    init(title: String? = nil, message: String? = nil, style: UIAlertController.Style) {
        dialog = UIAlertController(title: title, message: message, preferredStyle: style)
    }
    
    func setTitle(_ title: String) -> AlertBuilder {
        dialog.title = title
        return self
    }
    
    func setMessage(_ message: String) -> AlertBuilder {
        dialog.message = message
        return self
    }
    
    func addAction(_ name: String, completion: ((UIAlertAction) -> Void)?, style: UIAlertAction.Style = .default) -> AlertBuilder {
        let action = UIAlertAction(title: name, style: style, handler: completion)
        dialog.addAction(action)
        return self
    }
    
    func addField(_ placeholder: String) -> AlertBuilder {
        dialog.addTextField { textField in
            textField.placeholder = placeholder
        }
        return self
    }
    
    func build() -> UIAlertController {
        return dialog
    }
}
