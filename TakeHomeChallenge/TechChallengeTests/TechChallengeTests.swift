//
//  TechChallengeTests.swift
//  TechChallengeTests
//
//  Created by Adrian Tineo Cabello on 30/7/21.
//

import XCTest
@testable import TechChallenge

class TechChallengeTests: XCTestCase {

    var transactionVMTest:ViewModel?
    
    override func setUpWithError() throws {
       transactionVMTest = ViewModel()
    }

    override func tearDownWithError() throws {
        transactionVMTest = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

    
    // Using the included static sample data for testing
    func testTransactionFilteringByCategory() throws {
        transactionVMTest?.updateFilter(.entertainment)
        XCTAssertEqual(transactionVMTest?.filteredTransactions.count, entertainmentCategoryCount)
        
        transactionVMTest?.updateFilter(.food)
        XCTAssertEqual(transactionVMTest?.filteredTransactions.count, foodCategoryCount)
        
        transactionVMTest?.updateFilter(.health)
        XCTAssertNotEqual(transactionVMTest?.filteredTransactions.count, travelCategoryCount)
    }
 
    
    func testFilteredTransactionsTotal(){
        transactionVMTest?.updateFilter(.entertainment)
        XCTAssertEqual(transactionVMTest?.totalTransactions(), entertainmentCategorySum)
        
        transactionVMTest?.updateFilter(.health)
        XCTAssertNotEqual(transactionVMTest?.totalTransactions(), foodCategorySum)
        
        transactionVMTest?.updateFilter(.travel)
        XCTAssertEqual(transactionVMTest?.totalTransactions(), travelCategorySum)
    }
    
}


extension TechChallengeTests {
    var entertainmentCategoryCount:Int {
        return 1
    }
    
    var foodCategoryCount:Int {
        return 5
    }
    
    var travelCategoryCount:Int {
        return 3
    }
    
    
    
    var entertainmentCategorySum:Double {
        return 82.99
    }
    
    var foodCategorySum:Double {
        return 74.28
    }
    
    var travelCategorySum:Double {
        return 215.28
    }
}
