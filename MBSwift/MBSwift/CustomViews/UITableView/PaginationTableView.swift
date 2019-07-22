//
//  PaginatedTableView.swift
//  MBSwift
//
//  Created by Siarhei on 7/21/19.
//  Copyright © 2019 MBicycle. All rights reserved.
//

import Foundation

enum TableViewPaginationType {
    case top, bottom
}

class PaginationTableView: UITableView {
    
    var paginatinType: TableViewPaginationType = .bottom
    var paginationAction: (() -> Void)?
    var isPaginationEnabled: Bool = true
    var ratio: CGFloat = 0.7
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        delegate = self
    }
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        delegate = self
    }
    
    private func refreshIfNeeded(_ offsetY: CGFloat) {
        if paginatinType == .bottom {
            let breakpoint = contentSize.height - offsetY
            if (contentSize.height * ratio) > breakpoint {
                paginationAction?()
            }
        } else {
            let breakpoint = contentSize.height - offsetY
            if (contentSize.height * (1 - ratio)) > breakpoint {
                paginationAction?()
            }
        }
    }
}

extension PaginationTableView: UITableViewDelegate {
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if decelerate == false && isPaginationEnabled {
            let offsetY = scrollView.contentOffset.y
            refreshIfNeeded(offsetY)
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if isPaginationEnabled {
            let offsetY = scrollView.contentOffset.y
            refreshIfNeeded(offsetY)
        }
    }
}
