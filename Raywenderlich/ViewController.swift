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

class ViewController: UIViewController {
    
    var items = ["Debug"]
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
     
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.collectionView.reloadData()
        }
    }
    
    func setRandomColor() -> UIColor {
        let rand1 = CGFloat.random(in: 0...255)
        let rand2 = CGFloat.random(in: 0...255)
        let rand3 = CGFloat.random(in: 0...255)
        
        let color = UIColor(red: rand1/255, green: rand2/255, blue: rand3/255, alpha: 1)
        
        return color
        
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        let lb = cell.viewWithTag(1) as? UILabel
        lb?.text = self.items[indexPath.row]
        lb?.backgroundColor = UIColor.black.withAlphaComponent(0.5)

//        lb?.frame.size.width += 20
//        lb?.frame.size.height += 10
//        lb?.layer.cornerRadius = 5
//        lb?.layer.masksToBounds = true
//
//        cell.backgroundColor = self.setRandomColor()
//
//        cell.contentView.layoutIfNeeded()
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let w = self.view.frame.width / 3
//        
//        return CGSize(width: w, height: w)
//    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vcName = "\(items[indexPath.row])ViewController"
        let vc = UIViewController(nibName: vcName, bundle: nil)
        vc.navigationItem.title = items[indexPath.row]
        self.show(vc, sender: nil)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
    
}

