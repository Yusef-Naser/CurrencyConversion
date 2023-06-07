//
//  SelectCurrencyVMTests.swift
//  CurrencyTests
//
//  Created by yusef naser on 07/06/2023.
//

import XCTest
@testable import Currency

final class SelectCurrencyVMTests: XCTestCase {

    private var viewModel: SelectCurrencyVM!
    
    override func setUp() {
        super.setUp()
        viewModel = SelectCurrencyVM()
        
    }
    
    override func tearDown() {
        super.tearDown()
        viewModel = nil
    }

    func testLoadCurrencies () {
        viewModel.loadCurrenceis(cur: Mocks.currenciesEntities)
        XCTAssertEqual(viewModel.currencies?.symbols, Mocks.currenciesEntities.symbols)
    }

    func testLoadError () {
        let error = NSError(domain: "", code: 401, userInfo: [ NSLocalizedDescriptionKey: "Error Fetching Data"])
        
        XCTAssertEqual(viewModel.showAlert, false )
        viewModel.loadErrors(error: error as Error)
        XCTAssertEqual(viewModel.errorMessage, "Error Fetching Data")
        XCTAssertEqual(viewModel.showAlert, true )
    }

}
