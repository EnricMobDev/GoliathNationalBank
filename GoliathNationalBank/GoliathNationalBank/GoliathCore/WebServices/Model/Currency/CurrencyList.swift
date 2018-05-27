//
//  CurrencyList.swift
//  GoliathNationalBank
//
//  Created by Enric Pou Villanueva on 27/5/18.
//  Copyright © 2018 Enric Pou Villanueva. All rights reserved.
//

import Foundation

struct CurrencyList: Decodable {
    
    public var from: String
    public var to: String
    public var rate: String
}
