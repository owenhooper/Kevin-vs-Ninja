//
//  BottomHealth.swift
//  three-punch-fight
//
//  Created by Owen Hooper on 2016-02-25.
//  Copyright © 2016 Owen Hooper. All rights reserved.
//

import Foundation
import UIKit

class BottomHealth: UIImageView {
    var health = 10
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        changeView()
    }
    
    func changeView() {
        if health <= 0 {
            self.image = UIImage(named: "Health10.png")
        } else {
        self.image = UIImage(named: "Health\(health).png")
        }
    }
    
    
}