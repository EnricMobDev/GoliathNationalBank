//
//  TransactionPetition.swift
//  GoliathNationalBank
//
//  Created by Enric Pou Villanueva on 27/5/18.
//  Copyright © 2018 Enric Pou Villanueva. All rights reserved.
//

import Foundation
import Alamofire

class TransactionPetition {
    
    //MARK: - Variables
    var transactionList: [TransactionList] = []
    
    //MARK: - fetchTransactionList
    func fetchTransactionList(success: @escaping ([TransactionList]) -> (Void),
                              failure: @escaping (Error) -> Void) {
        
        Alamofire.request(Utils.TRANSACTION_URL).responseJSON { (response) in
            
            if let dataResponse = response.data {
                
                do {
                    self.transactionList = try JSONDecoder().decode([TransactionList].self, from: dataResponse)
                    success(self.transactionList)
                    
                } catch {
                    failure(error)
                }
            }
        }
    }
}
