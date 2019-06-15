//
//  ViewController.swift
//  Raywnderlich_Debug_1
//
//  Created by kimjiseob on 2019/06/15.
//  Copyright © 2019 kimjiseob. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView: UITableView?
    
    var items = [Int](1...100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.view.layoutIfNeeded()
        var frame = self.view.bounds
        frame.size.height = frame.size.height/2
        tableView = UITableView(frame: frame)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.reloadData()
        self.view.addSubview(tableView!)
        
        
        let btn = UIButton(frame: CGRect(x: 10, y: frame.height + 30, width: 30, height: 30))
        btn.backgroundColor = .blue
        btn.addTarget(self, action: #selector(self.action), for: .touchUpInside)
        
        self.view.addSubview(btn)
    }
    
    @objc func action() {
        tableView?.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = self.items[indexPath.row].description

        return cell
    }
    


}

