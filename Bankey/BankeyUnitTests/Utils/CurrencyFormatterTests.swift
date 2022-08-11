//
//  CurrencyFormatterTests.swift
//  BankeyUnitTests
//
//  Created by Mitya Kim on 8/9/22.
//

import Foundation
import XCTest

@testable import Bankey

class Test: XCTestCase {
    var formatter: CurrencyFormatter!
    
    override func setUp() {
        super.setUp()
        formatter = CurrencyFormatter()
    }
    
    func testBreakDollarsIntoCents() throws {
        let result = formatter.breakIntoDollarsAndCents(999929.78)
        XCTAssertEqual(result.0, "999,929")
        XCTAssertEqual(result.1, "78")
    }
    
    func testDollarsFormatted() throws {
        let result = formatter.dollarsFormatted(999929.78)
        XCTAssertEqual(result, "$999,929.78")
    }
    
    func testZeroDollarsFormatted() throws {
        let result = formatter.dollarsFormatted(0.00)
        XCTAssertEqual(result, "$0.00")
    }
}
