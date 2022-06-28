//
//  TransactionListView.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 27/7/21.
//

import SwiftUI

struct Categories {
    
}

struct TransactionListView: View {
    @EnvironmentObject var transactionVM:ViewModel
    var body: some View {
        
        VStack {
            ScrollView(.horizontal) {
                HStack {
                    
                    Button {
                        transactionVM.updateFilter(nil)
                    } label: {
                        Text("All")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            
                    }.background(Color.black)
                        .cornerRadius(25)
                        .padding()

                    
                    ForEach (TransactionModel.Category.allCases) { category in
                       
                        Button {
                            transactionVM.updateFilter(category)
                        } label: {
                            Text(category.rawValue)
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                                
                        }.background(category.color)
                            .cornerRadius(25).padding()
                        
                    }
                   
                }
            }.frame(height:80)
                .background(Color.accentColor.opacity(0.8))
            
            // List
            List {
                ForEach(transactionVM.filteredTransactions) { transaction in
                    TransactionView(transaction: transaction)
                }
            }
            .animation(.easeIn)
            .listStyle(PlainListStyle())
            .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Transactions")
            
            FloatingSumView().padding(8)
           
        }
    }
}

#if DEBUG
struct TransactionListView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionListView().environmentObject(ViewModel())
    }
}
#endif
