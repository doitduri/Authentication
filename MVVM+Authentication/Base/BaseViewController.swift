//
//  BaseViewController.swift
//  MVVM+Authentication
//
//  Created by 김두리 on 2021/12/14.
//

import UIKit
import RxSwift

class BaseViewController: UIViewController {
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        self.bindViewModelInput()
        self.bindViewModelOutput()
        bindEvent()
    }
    
    
    func bindViewModel() {}
    func bindViewModelInput() {}
    func bindViewModelOutput() {}
    func bindEvent() {}
}
