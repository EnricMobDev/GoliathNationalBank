//
//  GoliathViewController.swift
//  GoliathNationalBank
//
//  Created by Enric Pou Villanueva on 27/5/18.
//  Copyright © 2018 Enric Pou Villanueva. All rights reserved.
//

import UIKit

class GoliathViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var transactionTable: UITableView!
    
    //MARK: - Variables
    var createCells: [DrawerItemProtocol] = []
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchTransactionsProperties()
    }
    
    //MARK: - Private methods
    func fetchTransactionsProperties() {
        
        let transactionPetition = TransactionController()
        
        transactionPetition.fetchTransactionData(success: { (response) -> (Void) in
            
            for eachTransaction in response {
                
                self.createCells.append(TransactionCell(transaction: eachTransaction.sku,
                                                        amount: eachTransaction.amount,
                                                        currency: eachTransaction.currency))
            }
            self.transactionTable.reloadData()
            
        }) { (error) in
            self.serverAlert(error: error)
            self.fetchTransactionsProperties()
        }
    }
    
    func serverAlert(error: Error) {
        
        let alert = UIAlertController(title: String(describing: error), message: "Server Error", preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension GoliathViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return createCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = createCells[indexPath.row]
        let drawer = item.cellDrawer
        
        let cell = drawer.tableView(tableView, cellForRowAt: indexPath)
        drawer.drawCell(cell, withItem: item)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = Utils.ESTIMATED_ROW_HEIGHT
        return tableView.rowHeight
    }
}




