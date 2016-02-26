//
//  BottomAttack.swift
//  three-punch-fight
//
//  Created by Owen Hooper on 2016-02-25.
//  Copyright © 2016 Owen Hooper. All rights reserved.
//

import Foundation
import UIKit

class BottomAttack: UIImageView {
    var stam = 3
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        changeView()
    }
    
    func changeView() {
    if stam == 3 {
    self.image = UIImage(named: "HUD1.png")
    } else if stam == 2 {
        self.image = UIImage(named: "HUD2.png")
    } else if stam == 1 {
        self.image = UIImage(named: "HUD3.png")
    } else {
        self.image = UIImage(named: "HUD4.png")
        }
    }
}
