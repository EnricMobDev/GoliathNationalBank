//
//  TransactionCellDrawer.swift
//  GoliathNationalBank
//
//  Created by Enric Pou Villanueva on 27/5/18.
//  Copyright © 2018 Enric Pou Villanueva. All rights reserved.
//

import Foundation
import UIKit

internal final class TransactionCellDrawer: CellDrawerProtocol {
    
    // MARK: - Constants
    private struct Constants {
        static let reuseID = "TransactionCell"
        
    }
    
    // MARK: - CellDrawerProtocol
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return tableView.dequeueReusableCell(withIdentifier: Constants.reuseID,
                                             for: indexPath)
    }
    
    func drawCell(_ cell: UITableViewCell, withItem item: Any) {
        
        guard let cell = cell as? DetailTransactionCell,
            let item = item as? TransactionCell else {
                return
        }
        
        cell.selectionStyle = .none
        cell.transactionLabel.text = item.transaction
        cell.amountLabel.text = item.amount
        cell.currencyLabel.text = item.currency
    }
}

// MARK: - Cell + DrawerItem
extension TransactionCell: DrawerItemProtocol {
    
    var cellDrawer: CellDrawerProtocol {
        
        return TransactionCellDrawer()
    }
}

