//
//  ViewModel.swift
//  TechChallenge
//
//  Created by samuel maura on 6/27/22.
//

import Foundation


class ViewModel: ObservableObject {
    
   @Published var filteredTransactions:[TransactionModel]
   private let allTransactions:[TransactionModel]
   @Published var selectedCategory:TransactionModel.Category?
   @Published var unpinnedTransactions:Set<TransactionModel> = []
    
    init(){
        filteredTransactions = ModelData.sampleTransactions
        allTransactions = ModelData.sampleTransactions
    }
    
    func updateFilter(_ category: TransactionModel.Category?){
        selectedCategory = category
        
        if let category = category {
            filteredTransactions = allTransactions.filter{ $0.category == category}
        }
        else {
            filteredTransactions = allTransactions
        }
    }
    
    
    func unpinnedTransactionToggle(transaction:TransactionModel){
        
        if unpinnedTransactions.contains(transaction) {
            unpinnedTransactions.remove(transaction)
        }
        else {
            unpinnedTransactions.insert(transaction)
        }
        
    }
    
    
    func totalTransactions() -> Double {
        var total = 0.0
        for item in filteredTransactions {
            if unpinnedTransactions.contains(item) == false {
                total += item.amount
            }
        }
        
        return total
        
    }
    
    func totalForAllButUnpinnedTransactions() -> Double {
        var total = 0.0
        for item in allTransactions {
            if unpinnedTransactions.contains(item) == false {
                total += item.amount
            }
        }
        
        return total
    }
    
    
    
    func cummulativeExpense(for category:TransactionModel.Category) -> Double {
        var cummulativeTotal:Double = 0.0
        for item in allTransactions {
            if item.category ==  category &&  unpinnedTransactions.contains(item) == false {
                cummulativeTotal += item.amount
            }
        }
       
        return cummulativeTotal
    }
    
}
