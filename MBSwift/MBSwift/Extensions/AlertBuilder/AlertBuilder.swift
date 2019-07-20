//
//  AlertBuilder.swift
//  MBSwift
//
//  Created by Siarhei on 7/20/19.
//  Copyright © 2019 MBicycle. All rights reserved.
//

import Foundation

class DialogBuilder {
    
    private let dialog: UIAlertController!
    
    init(style: UIAlertController.Style) {
        dialog = UIAlertController(title: nil, message: nil, preferredStyle: style)
    }
    
    func setTitle(_ title: String) -> DialogBuilder {
        dialog.title = title
        return self
    }
    
    func setMessage(_ message: String) -> DialogBuilder {
        dialog.message = message
        return self
    }
    
    func addAction(_ name: String, completion: ((UIAlertAction) -> Void)?, style: UIAlertAction.Style = .default) -> DialogBuilder {
        let action = UIAlertAction(title: name, style: style, handler: completion)
        dialog.addAction(action)
        return self
    }
    
    func addField(_ placeholder: String) -> DialogBuilder {
        dialog.addTextField { textField in
            textField.placeholder = placeholder
        }
        return self
    }
    
    func build() -> UIAlertController {
        return dialog
    }
}
