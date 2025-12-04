//
//  StoreManagerTests.swift
//  StudentsToDo
//
//  Created by SDGKU
//

import XCTest
@testable import StudentsToDo

final class StoreManagerTests: XCTestCase {
    var storeManager: StoreManager!
    
    override func setUpWithError() throws {
        storeManager = StoreManager()
    }

    override func tearDownWithError() throws {
        storeManager = nil
    }
    
    func testFreeUserGroupLimit() {
        XCTAssertTrue(storeManager.canAddGroup(currentGroupCount: 0))
        XCTAssertTrue(storeManager.canAddGroup(currentGroupCount: 2))
        XCTAssertFalse(storeManager.canAddGroup(currentGroupCount: 3), "Free user should not be able to add the 4th group")
        XCTAssertFalse(storeManager.canAddGroup(currentGroupCount: 4))
    }
    
    func testProUserGroupLimit() {
        storeManager.isPro = true
        XCTAssertTrue(storeManager.canAddGroup(currentGroupCount: 10), "Pro user can exceed the limit")
        XCTAssertTrue(storeManager.canAddGroup(currentGroupCount: 100), "Pro user can exceed the limit")
        
    }
}
