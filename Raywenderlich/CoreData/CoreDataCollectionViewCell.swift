//
//  CoreDataCollectionViewCell.swift
//  Raywenderlich
//
//  Created by kimjiseob on 17/06/2019.
//  Copyright © 2019 kimjiseob. All rights reserved.
//

import UIKit

class CoreDataCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbNickNm: UILabel!
    @IBOutlet weak var lbAge: UILabel!
    @IBOutlet weak var view: UIView!
    
    
    func updateCell(info: UserInfo){
        self.lbName.text = info.name ?? ""
        self.lbNickNm.text = info.nickName ?? ""
        self.lbAge.text = "Age: \(info.age)"
        view.backgroundColor = UIColor.getRandomColor(alpha: 0.3)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
