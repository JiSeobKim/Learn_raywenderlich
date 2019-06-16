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
    
    private var items = ["Debug"]
    private let disposeBag = DisposeBag()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
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
        
        
        cell.updateCell(text: self.items[indexPath.row])
        
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
        let vcName = "\(items[indexPath.row])ViewController"
//        let vc = DebugViewController(nibName: vcName, bundle: nil)
        let classFile = NSClassFromString(vcName) as! NSObject.Type
    
        
        
        let vc = UIViewController(nibName: vcName, bundle: nil) as! classFile.self
        
//        vc.navigationItem.title = items[indexPath.row]
//        self.show(vc, sender: nil)
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

