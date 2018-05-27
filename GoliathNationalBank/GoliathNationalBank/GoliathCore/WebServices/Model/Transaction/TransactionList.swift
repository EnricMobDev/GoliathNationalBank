//
//  TransactionList.swift
//  GoliathNationalBank
//
//  Created by Enric Pou Villanueva on 27/5/18.
//  Copyright © 2018 Enric Pou Villanueva. All rights reserved.
//

import Foundation

struct TransactionList: Decodable {
    
    public var sku: String
    public var amount: String
    public var currency: String
}
