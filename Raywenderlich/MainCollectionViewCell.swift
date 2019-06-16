//
//  MainCellCollectionViewCell.swift
//  Raywenderlich
//
//  Created by kimjiseob on 2019/06/16.
//  Copyright © 2019 kimjiseob. All rights reserved.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var lbTitle: UILabel!
    
    func updateCell(text: String) {
        self.contentView.backgroundColor = UIColor.getRandomColor(alpha: 0.4)
        self.lbTitle.text = text
        DispatchQueue.main.async {
            self.lbTitle.frame.size.width += 10
            self.lbTitle.frame.size.height += 10
            self.lbTitle.layer.cornerRadius = 8
            self.lbTitle.layer.masksToBounds = true
            self.lbTitle.center = self.contentView.center
        }
        
        
    }
    
    
    
}
