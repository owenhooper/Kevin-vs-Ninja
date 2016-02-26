//
//  NinjaImg.swift
//  three-punch-fight
//
//  Created by Owen Hooper on 2016-02-25.
//  Copyright © 2016 Owen Hooper. All rights reserved.
//

import Foundation
import UIKit

class NinjaImg: UIImageView {
   
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        playStandAnimation()
    }
    
    
    func playStandAnimation() {
        self.image = UIImage(named: "NinjaStand1.png")
        
        self.animationImages = nil
        
        var imgArray = [UIImage]()
        for var x = 1; x <= 3; x++ {
            let img = UIImage(named: "NinjaStand\(x).png")
            imgArray.append(img!)
        }
        
        self.animationImages = imgArray
        self.animationDuration = 0.8
        self.animationRepeatCount = 0
        self.startAnimating()
    }
    
    func playPunchAnimation() {
        
        self.image = UIImage(named: "NinjaPunch1.png")
        
        self.animationImages = nil
        
        var imgArray = [UIImage]()
        for var x = 1; x <= 3; x++ {
            let img = UIImage(named: "NinjaPunch\(x).png")
            imgArray.append(img!)
        }
        
        self.animationImages = imgArray
        self.animationDuration = 0.8
        self.animationRepeatCount = 1
        self.startAnimating()
        
    }
    
    func playDieAnimation() {
        
        self.image = UIImage(named: "NinjaDie1.png")
        
        self.animationImages = nil
        
        var imgArray = [UIImage]()
        for var x = 1; x <= 3; x++ {
            let img = UIImage(named: "NinjaDie\(x).png")
            imgArray.append(img!)
        }
        
        self.animationImages = imgArray
        self.animationDuration = 2.5
        self.animationRepeatCount = 1
        self.startAnimating()
        
    }
    
}