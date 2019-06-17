//
//  ViewController.swift
//  Raywenderlich
//
//  Created by kimjiseob on 2019/06/15.
//  Copyright © 2019 kimjiseob. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MainViewController: UIViewController {
    
    enum VCList: String, CaseIterable {
        case debug = "Debug"
        case coreData = "CoreData"
        
        func getVCName() -> String {
            return self.rawValue + "ViewController"
        }
        
    }
    
    private var items: [VCList] = []
    private let disposeBag = DisposeBag()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        for row in VCList.allCases {
            items.append(row)
        }
        
        setNaviButton()
    }
    
    
    private func setNaviButton() {
        let btn = UIBarButtonItem(title: "Refresh", style: .plain, target: self, action: nil)
        btn.rx.tap.subscribe { (_) in
            self.collectionView.reloadData()
            print("Tap Action")
        }.disposed(by: disposeBag)
        
        self.navigationItem.rightBarButtonItem = btn
    }
    
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? MainCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        
        cell.updateCell(text: self.items[indexPath.row].rawValue)
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = self.view.frame.width / 3
        
        return CGSize(width: w, height: w)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let item = items[indexPath.row]
        let vcName = item.getVCName()
        
        switch item {
        case .debug:
            let vc = DebugViewController(nibName: vcName, bundle: nil)
            vc.navigationItem.title = item.rawValue
            self.show(vc, sender: self)
            
        case .coreData :
            let vc = CoreDataViewController(nibName: vcName, bundle: nil)
            vc.navigationItem.title = item.rawValue
            self.show(vc, sender: self)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

