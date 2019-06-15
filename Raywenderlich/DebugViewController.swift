//
//  DebugViewController.swift
//  Raywenderlich
//
//  Created by kimjiseob on 2019/06/16.
//  Copyright © 2019 kimjiseob. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class DebugViewController: UIViewController {

    let disposeBag = DisposeBag()
    
    @IBOutlet weak var lbFlush: UILabel!
    @IBOutlet weak var btnFlush: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        btnFlush.rx.tap.subscribe { (_) in
//            print("옆에 Label로 테스트하세여")
//        }.disposed(by: disposeBag)
        
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
