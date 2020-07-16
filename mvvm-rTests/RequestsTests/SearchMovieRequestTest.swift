//
//  SearchMovieRequestTest.swift
//  mvvm-rTests
//
//  Created by Mehmet Salih Aslan on 12.07.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

import XCTest
@testable import DataProvider

class SearchMovieRequestTest: XCTestCase {
    
    func testRequest() throws {
        let request = SearchMovieRequest(keyword: "avengers", page: 0)
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
