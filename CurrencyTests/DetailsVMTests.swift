//
//  DetailsVMTests.swift
//  CurrencyTests
//
//  Created by yusef naser on 07/06/2023.
//

import XCTest
@testable import Currency

final class DetailsVMTests: XCTestCase {

    var viewModel : DetailsVM!
    
    override func setUp() {
        super.setUp()
        viewModel = DetailsVM()
    }
    
    override func tearDown() {
        super.tearDown()
        viewModel = nil
    }
    
    
    func testLoadResult () {
        viewModel.loadResult(result: Mocks.convertCurrencyEntity)
        XCTAssertEqual(viewModel.convertedCurrency , Mocks.convertCurrencyEntity)
    }
    
    func testLoadError () {
        let error = NSError(domain: "", code: 401, userInfo: [ NSLocalizedDescriptionKey: "Error Fetching Data"])
        XCTAssertEqual(viewModel.showAlert, false )
        viewModel.loadError(error: error as Error)
        XCTAssertEqual(viewModel.errorMessage, "Error Fetching Data")
        XCTAssertEqual(viewModel.showAlert, true )
    }
    

}
