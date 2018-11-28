//
//  ViewController.swift
//  APIExample
//
//  Created by Oleg Ten on 11/28/18.
//  Copyright © 2018 Oleg Ten. All rights reserved.
//

import UIKit
import RxSwift


class ViewController: UIViewController {
    
    var array = [Service]()
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        API.shared.getServices().subscribe(onNext: { [weak self] services in
            self!.array = services
            }, onError: {e in
                print(e)
                }).disposed(by: disposeBag)
        print(array)
    }
    
    
}

