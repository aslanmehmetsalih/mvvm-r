//
//  GetMovieDetailRequestTest.swift
//  mvvm-rTests
//
//  Created by Mehmet Salih Aslan on 12.07.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

import XCTest
@testable import mvvm_r

class GetMovieDetailRequestTest: XCTestCase {

    func testRequest() {
        let request = GetMovieDetailRequest(id: "1")
        let dataProvider = MockDataProvider()
        dataProvider.getData(for: request) { (result) in
            switch result {
            case .success:
                XCTAssert(true)
            case .failure:
                XCTAssert(false)
            }
        }
    }

}
