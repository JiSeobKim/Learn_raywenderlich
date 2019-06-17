//
//  CoreDataViewController.swift
//  Raywenderlich
//
//  Created by kimjiseob on 17/06/2019.
//  Copyright © 2019 kimjiseob. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import CoreData

class CoreDataViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    private let context = Utils.appDelegate.persistantContainer.viewContext
    private var userDatas = [UserInfo]()
    private var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setSearch()
        self.setCollectionView()
        self.setAddButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.disposeBag = DisposeBag()
    }
    
    private func setSearch() {
        searchBar.delegate = self
        self.searchBar
            .rx
            .text
            .orEmpty
            .distinctUntilChanged()
            .subscribe{ text in
                do {
                    if text.element?.isEmpty == true {
                        self.dataRefresh()
                    } else {
                        let request = UserInfo.fetchRequest() as NSFetchRequest<UserInfo>
                        request.predicate = NSPredicate(format: "name CONTAINS %@", text.element!)
                        self.userDatas = try self.context.fetch(request)
                    }
                    
                    self.collectionView.reloadData()
                } catch let error {
                    print(error.localizedDescription)
                }
        }.disposed(by: disposeBag)
    }
    
    private func setAddButton() {
        let btn = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
        
        btn.rx.tap.subscribe { (_) in
            let addVC = AddUserViewController(nibName: "AddUserViewController", bundle: nil)
            addVC.navigationItem.title = "AddUser"
            self.show(addVC, sender: self)
            }.disposed(by: disposeBag)
        self.navigationItem.rightBarButtonItem = btn
    }

    /// Set CollectionView Info
    private func setCollectionView() {
        self.collectionView.register(UINib(nibName: "CoreDataCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        collectionView.delegate = self
        collectionView.dataSource = self
        dataRefresh()
    }
    
    /// Mark: - Refresh Fetch
    private func dataRefresh() {
        do {
            self.userDatas = try context.fetch(UserInfo.fetchRequest())
        } catch let error {
            print("Error: \(error.localizedDescription)")
        }
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

extension CoreDataViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.userDatas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CoreDataCollectionViewCell
        
        let data: UserInfo = self.userDatas[indexPath.row]
        
        cell.updateCell(info: data)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = Utils.appWidth / 2
        
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension CoreDataViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
    }
}

