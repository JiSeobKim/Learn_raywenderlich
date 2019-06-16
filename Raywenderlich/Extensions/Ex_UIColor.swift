//
//  Ex_UIColor.swift
//  Raywenderlich
//
//  Created by kimjiseob on 2019/06/16.
//  Copyright © 2019 kimjiseob. All rights reserved.
//

import UIKit

extension UIColor {
    class func getRandomColor(alpha: CGFloat = 1) -> UIColor {
        let rand1 = CGFloat.random(in: 0...255) / 255
        let rand2 = CGFloat.random(in: 0...255) / 255
        let rand3 = CGFloat.random(in: 0...255) / 255
        
        return UIColor(red: rand1, green: rand2, blue: rand3, alpha: alpha)
    }
}
