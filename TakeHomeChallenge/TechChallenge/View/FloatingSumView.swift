//
//  FloatingSumView.swift
//  TechChallenge
//
//  Created by samuel maura on 6/27/22.
//

import SwiftUI

struct FloatingSumView: View {
    @EnvironmentObject var transactionVM:ViewModel
    var body: some View {
        
            HStack {
                
                VStack {
                Spacer()
                    Text("Total spent:").secondary()
                }.padding()
                
                Spacer()
                
                VStack(alignment:.trailing) {
                    Text("\( transactionVM.selectedCategory?.rawValue ?? "All" )")
                        .foregroundColor(transactionVM.selectedCategory?.color ?? Color.black)
                        .font(.headline)
                    Text("$\(transactionVM.totalTransactions().formatted())")
                        .fontWeight(.bold)
                        .secondary()
                        
                }.padding()
                
            }
            .frame(height:70)
            .overlay(RoundedRectangle(cornerRadius: 8)
                .stroke(lineWidth: 2) )
        
    }
}

struct FloatingSumView_Previews: PreviewProvider {
    static var previews: some View {
        FloatingSumView().environmentObject(ViewModel())
    }
}
