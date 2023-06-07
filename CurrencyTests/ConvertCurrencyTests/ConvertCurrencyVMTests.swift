//
//  ConvertCurrencyVMTests.swift
//  CurrencyTests
//
//  Created by yusef naser on 07/06/2023.
//

import XCTest
@testable import Currency

final class ConvertCurrencyVMTests: XCTestCase {

    var viewModel : ConvertCurrencyVM!
    
    override func setUp() {
        super.setUp()
        viewModel = ConvertCurrencyVM()
    }
    
    override func tearDown() {
        super.tearDown()
        viewModel = nil
    }
    
    func testConversionCurrenciesError() {
        XCTAssertEqual(viewModel.showAlert, false )
        viewModel.conversionCurrencies()
        XCTAssertEqual(viewModel.errorMessage, "Please select both Currenceis")
        XCTAssertEqual(viewModel.showAlert, true )
    }
    
    func testLoadResult () {
        viewModel.loadResult(convert: Mocks.convertCurrencyEntity)
        XCTAssertEqual(viewModel.convertedCurrency , Mocks.convertCurrencyEntity)
        XCTAssertEqual(viewModel.lastTimeStamp , Int64(Mocks.convertCurrencyEntity.timestamp ?? 0))
    }
    
    func testLoadError () {
        let error = NSError(domain: "", code: 401, userInfo: [ NSLocalizedDescriptionKey: "Error Fetching Data"])
        XCTAssertEqual(viewModel.showAlert, false )
        viewModel.loadError(error: error as Error)
        XCTAssertEqual(viewModel.errorMessage, "Error Fetching Data")
        XCTAssertEqual(viewModel.showAlert, true )
    }
    
    func testSwitchValues () {
        viewModel.currency_1 = Mocks.currencyEntities[0]
        viewModel.currency_2 = Mocks.currencyEntities[1]
        
        viewModel.switchValues()
        XCTAssertEqual(viewModel.currency_1, Mocks.currencyEntities[1])
        XCTAssertEqual(viewModel.currency_2, Mocks.currencyEntities[0])

    }
    
    func testRate () {
        viewModel.rateCurrency_1 = 5
        viewModel.rateCurrency_2 = 10
        viewModel.amountFrom = "2"
        viewModel.getRate()
        XCTAssertEqual(viewModel.amountTo, "4.0")
    }
    
}
