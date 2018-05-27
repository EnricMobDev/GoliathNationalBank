//
//  CellDrawerProtocol.swift
//  GoliathNationalBank
//
//  Created by Enric Pou Villanueva on 27/5/18.
//  Copyright © 2018 Enric Pou Villanueva. All rights reserved.
//

import Foundation
import UIKit

protocol CellDrawerProtocol {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    
    func drawCell(_ cell: UITableViewCell, withItem item: Any)
    
}
