//
//  Curator_for_CreatorTests.swift
//  Curator for CreatorTests
//
//  Created by Mahdi BND on 5/11/23.
//

import XCTest
@testable import Curator_for_Creator

class Curator_for_CreatorTests: XCTestCase {

	var loginViewModel: LoginVM<PreferenceStore>!
	
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
		loginViewModel = LoginVM()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

	func testEmptyLoginFormThrowsError() throws {
		XCTAssert(loginViewModel.email.isEmpty)
		XCTAssert(loginViewModel.password.isEmpty)
		XCTAssertThrowsError(try loginViewModel.login()) { error in
			guard case LoginError.formIsEmpty = error else {
				XCTFail("Unexpected Error")
				return
			}
		}
	}
	
	func testEmptyEmailThrowsError() throws {
		loginViewModel.password = "password"
		XCTAssert(loginViewModel.email.isEmpty)
		XCTAssertThrowsError(try loginViewModel.login()) { error in
			guard case LoginError.usernameIsEmpty = error else {
				XCTFail("Unexpected Error")
				return
			}
		}
	}
	
	func testEmptyPasswordThrowsError() throws {
		loginViewModel.email = "email"
		XCTAssert(loginViewModel.password.isEmpty)
		XCTAssertThrowsError(try loginViewModel.login()) { error in
			guard case LoginError.passwordIsEmpty = error else {
				XCTFail("Expected the thrown error to be passwordIsEmpty")
				return
			}
		}
	}
	
	func testLoginAttemptSavesToStorage() throws {
		loginViewModel.email = "admin"
		loginViewModel.password = "password"
		
		let data = UserData(user: User(), store: PreferenceStore())
		try loginViewModel.login()
		XCTAssert(data.loggedIn == true)
		// It does.
	}
	
	func testAppLaunchReadsFromStorage() throws {
		let data = UserData(user: User(), store: PreferenceStore())
		XCTAssert(data.loggedIn == true)
	}

//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
