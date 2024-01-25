//
//  SimpleMVVMTests.swift
//  SimpleMVVMTests
//
//  Created by Marco Antonio Flores Perez on 18/01/24.
//

import XCTest
@testable import SimpleMVVM

class RegisterViewControllerTests: XCTestCase {
    var sut: MockRegisterViewController!
    
    override func setUp() {
        super.setUp()
        sut = MockRegisterViewController()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_Registration_With_EmptyStrings_Returns_ErrorCase() {
        let error = sut.didRegisterWithNoError(email: "", password: "", confirmationPassword: "")
        XCTAssertTrue(error)
    }
    
    func test_Registration_With_NoValidEmail_Returns_ErrorCase() {
        let error = sut.didRegisterWithNoError(email: "testexample.com", password: "", confirmationPassword: "")
        XCTAssertTrue(error)
    }
    
    func test_Registration_With_NoValidPassword_Returns_ErrorCase() {
        let email = "test@example.com"
        let error = sut.didRegisterWithNoError(email: email, password: "ab", confirmationPassword: "")
        XCTAssertTrue(error)
    }
    
    func test_Registration_With_DifferentPasswords_Returns_ErrorCase() {
        let email = "test@example.com"
        let password = "1Ab"
        let error = sut.didRegisterWithNoError(email: email, password: password, confirmationPassword: "1A")
        XCTAssertTrue(error)
    }
    
    func test_Registration_With_ValidEmailAndPassword_Returns_NoErrorCase() {
        let email = "test@example.com"
        let password = "1Ab"
        let error = sut.didRegisterWithNoError(email: email, password: password, confirmationPassword: password)
        XCTAssertFalse(error)
    }
}
