//
//  ViewController.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 23.04.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let request = SearchMovieRequest(keyword: "avengers", page: 1)
        request.fetch(success: { (response) in
            if let first = response.search?.first, let id = first.imdbID {
                let request = GetMovieDetailRequest(id: id)
                request.fetch(success: nil, failure: nil)
            }
        }) { (error) in
            
        }
        
        // Do any additional setup after loading the view.
    }


}

