//
//  CurrencyPetition.swift
//  GoliathNationalBank
//
//  Created by Enric Pou Villanueva on 27/5/18.
//  Copyright © 2018 Enric Pou Villanueva. All rights reserved.
//

import Foundation
import Alamofire

class CurrencyPetition {
    
    //MARK: - Variables
    var currenciesList: [CurrencyList] = []
    
    //MARK: - fetchTransactionList
    func fetchTransactionList(success: @escaping ([CurrencyList]) -> (Void),
                              failure: @escaping (Error) -> Void) {
        
        Alamofire.request(Utils.TRANSACTION_URL).responseJSON { (response) in
            
            if let dataResponse = response.data {
                
                do {
                    self.currenciesList = try JSONDecoder().decode([CurrencyList].self, from: dataResponse)
                    success(self.currenciesList)
                    
                } catch {
                    failure(error)
                }
            }
        }
    }
}
