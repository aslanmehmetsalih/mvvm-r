//
//  SearchMoviesViewModelTests.swift
//  mvvm-rTests
//
//  Created by Mehmet Salih Aslan on 12.07.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

import XCTest
@testable import mvvm_r

class SearchMoviesViewModelTests: XCTestCase {

    func testPageZero() {
        let router = SearchMoviesRouter()
        let dataProvider = MockDataProvider()
        let viewModel = SearchMoviesViewModel(router: router, dataProvider: dataProvider)
        viewModel.setLoading = { _ in
            XCTAssert(true)
        }
        viewModel.fetchMovies(page: 0)
    }
    
    func testPageGreaterThanZero() {
        let router = SearchMoviesRouter()
        let dataProvider = MockDataProvider()
        let viewModel = SearchMoviesViewModel(router: router, dataProvider: dataProvider)
        viewModel.setLoading = { _ in
            XCTAssert(false)
        }
        viewModel.fetchMovies(page: 1)
    }

}
