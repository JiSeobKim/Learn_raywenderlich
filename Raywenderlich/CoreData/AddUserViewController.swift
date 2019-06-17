//
//  AddUserViewController.swift
//  Raywenderlich
//
//  Created by kimjiseob on 17/06/2019.
//  Copyright © 2019 kimjiseob. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class AddUserViewController: UIViewController {
    
    let context = Utils.appDelegate.persistantContainer.viewContext
    
    
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfNickName: UITextField!
    @IBOutlet weak var tfAge: UITextField!
    
    
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setNaviItems()
        self.observeTextfields()
        
    }

    private func setNaviItems() {
        let clear = getNaviAllClearBtn()
        let save = getNaviSaveBtn()
        self.navigationItem.rightBarButtonItems = [save, clear]
    }
    
    /// 저장 버튼
    private func getNaviSaveBtn() -> UIBarButtonItem{
        let btn = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: nil)
        btn.rx.tap.subscribe { (_) in
            if let name = self.tfName.text, let nickName = self.tfNickName.text, let ageStr = self.tfAge.text, let age = Int16(ageStr) {
                let data = UserInfo(entity: UserInfo.entity(), insertInto: self.context)
                data.name = name
                data.age = age
                data.nickName = nickName
                Utils.appDelegate.saveContext()
                self.navigationController?.popViewController(animated: true)
            }
        }.disposed(by: disposeBag)
        return btn
    }
    
    /// 텍스트 모두 제거 버튼
    private func getNaviAllClearBtn() -> UIBarButtonItem {
        let btn = UIBarButtonItem(title: "Clear", style: .plain, target: self, action: nil)
        btn.rx.tap.subscribe { (_) in
            self.clearAllText()
            }.disposed(by: disposeBag)
        return btn
    }
    
    
    /// 텍스트 클리어
    private func clearAllText() {
        self.tfName.text = ""
        self.tfNickName.text = ""
        self.tfAge.text = ""
        self.view.endEditing(true)
    }
    
    /// Textfield Observe
    private func observeTextfields() {
        let observeNameEmpty = tfName.rx.text.orEmpty.map{!$0.isEmpty}.share(replay:1)
        let observeNickNameEmpty = tfNickName.rx.text.orEmpty.map{!$0.isEmpty}.share(replay:1)
        let observeAgeEmpty = tfAge.rx.text.orEmpty.map{!$0.isEmpty}.share(replay:1)
        
        Observable
            .combineLatest(observeNameEmpty, observeNickNameEmpty, observeAgeEmpty)
            .map{ $0 && $1 && $2}
            .bind(to: (self.navigationItem.rightBarButtonItems?.first?.rx.isEnabled)!)
            .disposed(by: disposeBag)
        
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
