//
//  CurrencyController.swift
//  GoliathNationalBank
//
//  Created by Enric Pou Villanueva on 27/5/18.
//  Copyright © 2018 Enric Pou Villanueva. All rights reserved.
//

import Foundation

class CurrencyController {
    
    //MARK: - Constants
    private let serviceController = CurrencyPetition()
    
    //MARK: - Public methods
    public func fetchTransactionData(success: @escaping ([CurrencyList]) -> (Void),
                                     serverFailure: @escaping (Error) -> Void) {
        
        serviceController.fetchTransactionList(success: { (response) -> (Void) in
            success(response)
        }, failure: { error in
            serverFailure(error)
        })
    }
}
// Create this class if in the future we need to use a bind
