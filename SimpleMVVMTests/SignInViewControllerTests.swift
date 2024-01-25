//
//  SignInViewControllerTests.swift
//  SimpleMVVMTests
//
//  Created by Marco Antonio Flores Perez on 24/01/24.
//

import XCTest
@testable import SimpleMVVM

class SignInViewControllerTests: XCTestCase {
    var sut: MockSignInViewController!
    
    override func setUp() {
        super.setUp()
        sut = MockSignInViewController()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_SignIn_With_EmptyStrings_Returns_ErrorCase() {
        let error = sut.didSignInWithNoError(email: "", password: "")
        XCTAssertTrue(error)
    }
    
    func test_SignIn_With_NoValidEmail_Returns_ErrorCase() {
        let error = sut.didSignInWithNoError(email: "testexample.com", password: "")
        XCTAssertTrue(error)
    }
    
    func test_SignIn_With_NoValidPassword_Returns_ErrorCase() {
        let email = "test@example.com"
        let error = sut.didSignInWithNoError(email: email, password: "ab")
        XCTAssertTrue(error)
    }
    
    func test_SignIn_With_IncorrectPassword_Returns_ErrorCase() {
        let email = "test@example.com"
        let password = "1Ab2"
        
        let error = sut.didSignInWithNoError(email: email, password: password)
        XCTAssertTrue(error)
    }
    
    func test_SignIn_With_ValidEmailAndPassword_Returns_NoErrorCase() {
        let email = "test@example.com"
        let password = "1Ab"
        let error = sut.didSignInWithNoError(email: email, password: password)
        XCTAssertFalse(error)
    }
}
