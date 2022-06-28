//
//  TechChallengeApp.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 27/7/21.
//

import SwiftUI

@main
struct TechChallengeApp: App {
   @StateObject var transactionVM = ViewModel()
    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationView {
                    TransactionListView().environmentObject(transactionVM)
                }
                .tabItem {
                    Label("Transactions", systemImage: "list.bullet")
                }
                
                NavigationView {
                    InsightsView().environmentObject(transactionVM)
                }
                .tabItem {
                    Label("Insights", systemImage: "chart.pie.fill")
                }
            }
        }
    }
}
