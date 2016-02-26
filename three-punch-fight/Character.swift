//
//  Character.swift
//  three-punch-fight
//
//  Created by Owen Hooper on 2016-02-25.
//  Copyright © 2016 Owen Hooper. All rights reserved.
//

import Foundation

class Character {
    
    private var _name = "Character"
    var hp: Int
    var stamina: Int = 3
    private var _attackPwr: Int = 1
    
    
    
    var name: String {
        get {
            return _name
        }
    }
    
    
    
    
    var attackPwr: Int {
        get {
            return _attackPwr
        }
    }
    
 
    
    init(startingHp: Int, name: String, attackPwr: Int, stamina: Int) {
        self.hp = startingHp
        _name = name
        self.stamina = stamina
        self._attackPwr = attackPwr
}

}
