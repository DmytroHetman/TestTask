//
//  TestTaskTests.swift
//  TestTaskTests
//
//  Created by Dmytro Hetman on 22.07.2022.
//

import XCTest

class TestTaskTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
       
        let app = XCUIApplication()
        
        let table = app.tables.element(boundBy: 0)
        let cell0 = table.cells.element(boundBy: 0)
        cell0.tap()
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
