//
//  ViewController.swift
//  three-punch-fight
//
//  Created by Owen Hooper on 2016-02-24.
//  Copyright © 2016 Owen Hooper. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var brownImg: BrownImg!
    
    @IBOutlet weak var ninjaImg: NinjaImg!
    
    @IBOutlet weak var brownUpImg: BrownUpImg!
    
    @IBOutlet weak var ninjaUpImg: NinjaUpImg!
    
    @IBOutlet weak var bottomAttack: BottomAttack!
   
    @IBOutlet weak var topAttack: TopAttack!

    @IBOutlet weak var brownAttack: UIButton!
   
    @IBOutlet weak var ninjaAttack: UIButton!
    
    @IBOutlet weak var countDownRed: UILabel!
    
    @IBOutlet weak var countDownBlue: UILabel!
    
    @IBOutlet weak var fightBtn: UIButton!
    
    @IBOutlet weak var bottomHealth: BottomHealth!
   
    @IBOutlet weak var topHealth: TopHealth!
    
    @IBOutlet weak var miniHud: UIImageView!
    
    @IBOutlet weak var topLbl: UILabel!
    
    @IBOutlet weak var bottomLbl: UILabel!
    
    var brown: Character!
    var ninja: Character!
    var timer = NSTimer()
    var restart = NSTimer()
    var wait = NSTimer()
    var seconds = 5
    var attackPower = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        brown = Character(startingHp: 10, name: "Brown", attackPwr: 1, stamina: 3)
        ninja = Character(startingHp: 10, name: "Ninja", attackPwr: 1, stamina: 3)
        
        countDownBlue.transform = CGAffineTransformMakeRotation(CGFloat(M_PI));
        topLbl.transform = CGAffineTransformMakeRotation(CGFloat(M_PI));

        
        
        
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: "seconds:", name: "onSecondTimer", object: nil)
       
       
        
    }
    @IBAction func onFightBtnPressed(sender: AnyObject) {
        startRound()
    }
    
    func updateButtons() {
        bottomAttack.stam = brown.stamina
        topAttack.stam = ninja.stamina
        bottomHealth.health = brown.hp
        topHealth.health = ninja.hp
        bottomAttack.changeView()
        topAttack.changeView()
        bottomHealth.changeView()
        topHealth.changeView()
        countDownRed.text = "\(seconds)"
        countDownBlue.text = "\(seconds)"
        
    }
  
    func subtractTime() {
        if seconds == 0 {
            timer.invalidate()
            brown.hp -= 1
            ninja.hp -= 1
            checkIfDead()
            updateButtons()
            brownAttack.hidden = true
            ninjaAttack.hidden = true
            topLbl.hidden = false
            bottomLbl.hidden = false
            topLbl.text = "Time violation!"
            bottomLbl.text = "Time violation!"
            miniHud.hidden = false
            fightBtn.hidden = false
        } else {
        seconds--
        increaseAttack()
        countDownRed.text = "\(seconds)"
        countDownBlue.text = "\(seconds)"
         
        }
        
    }
    
    func startTimer() {
        if seconds == 0 {
            timer.invalidate()
            miniHud.hidden = false
            fightBtn.hidden = false
        }
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: Selector("subtractTime"), userInfo: nil, repeats: true)
    }
    
    func increaseAttack() {
        attackPower++
    }
    
    func showFightBtn() {
        timer.invalidate()
        restart.invalidate()
        restartGame()
        miniHud.hidden = false
        fightBtn.hidden = false
        
    }
    
    func startRound() {
        topLbl.hidden = true
        bottomLbl.hidden = true
        topAttack.hidden = false
        bottomAttack.hidden = false
        miniHud.hidden = true
        fightBtn.hidden = true
       
        attackPower = 0
        seconds = 5
        if ninja.stamina > 0 {
        ninjaAttack.hidden = false
        } else { ninjaAttack.hidden = true
        }
        if brown.stamina > 0 {
        brownAttack.hidden = false
        } else { brownAttack.hidden = true
        }
        countDownRed.text = "\(seconds)"
        countDownBlue.text = "\(seconds)"
        brownImg.playStandAnimation()
        ninjaImg.playStandAnimation()
        brownUpImg.playStandAnimation()
        ninjaUpImg.playStandAnimation()
        startTimer()
        
    }
    
    func checkIfDead() {
        if ninja.hp <= 0 {
            ninjaImg.playDieAnimation()
            ninjaUpImg.playDieAnimation()
            brownAttack.hidden = true
            ninjaAttack.hidden = true
            topLbl.hidden = false
            bottomLbl.hidden = false
            topLbl.text = "You Lose"
            bottomLbl.text = "You Win"
            restart = NSTimer.scheduledTimerWithTimeInterval(2.5, target: self, selector: Selector("showFightBtn"), userInfo: nil, repeats: false)
            }
        
        if brown.hp <= 0 {
            brownImg.playDieAnimation()
            brownUpImg.playDieAnimation()
            ninjaAttack.hidden = true
            topLbl.hidden = false
            bottomLbl.hidden = false
            topLbl.text = "You Win"
            bottomLbl.text = "You Lose"
            restart = NSTimer.scheduledTimerWithTimeInterval(2.5, target: self, selector: Selector("showFightBtn"), userInfo: nil, repeats: false)
        }
    }
    
    func restartGame() {
        seconds = 5
        brown.hp = 10
        ninja.hp = 10
        brownImg.hidden = false
        ninjaImg.hidden = false
        brownImg.playStandAnimation()
        ninjaImg.playStandAnimation()
        brownUpImg.playStandAnimation()
        ninjaUpImg.playStandAnimation()
        brown.stamina = 3
        ninja.stamina = 3
        updateButtons()
        topLbl.hidden = true
        bottomLbl.hidden = true
        ninjaAttack.hidden = true
        brownAttack.hidden = true
        
        
        
      
    }
    
    @IBAction func onBrownAttackPressed(sender: AnyObject) {
        if brown.stamina > 0 {
         ninjaAttack.hidden = true
        brownAttack.hidden = true
        timer.invalidate()
            brownImg.playPunchAnimation()
            brownUpImg.playPunchAnimation()
        ninja.hp -= attackPower
            
            brown.stamina--
            updateButtons()
            topLbl.hidden = false
            bottomLbl.hidden = false
            topLbl.text = "Kevin Threw a \(attackPower)"
            bottomLbl.text = "You Threw a \(attackPower)"
            checkIfDead()
            miniHud.hidden = false
            fightBtn.hidden = false
            print(ninja.hp)
        } else {
            brownAttack.hidden = true
            bottomLbl.hidden = false
            bottomLbl.text = "Not enough stamina"
            print("you lose")
            
        }
        
    }
    
    @IBAction func onNinjaAttackPressed(sender: AnyObject) {
        if ninja.stamina > 0 {
            brownAttack.hidden = true
            ninjaAttack.hidden = true
        timer.invalidate()
            ninjaImg.playPunchAnimation()
            ninjaUpImg.playPunchAnimation()
        brown.hp -= attackPower
            
            ninja.stamina--
            updateButtons()
            topLbl.hidden = false
            bottomLbl.hidden = false
            topLbl.text = "You Threw a \(attackPower)"
            bottomLbl.text = "Ninja Threw a \(attackPower)"
            checkIfDead()
            miniHud.hidden = false
            fightBtn.hidden = false
            print(brown.hp)
            
        } else {
            print("you lose")
            ninjaAttack.hidden = true
            topLbl.hidden = false
            topLbl.text = "Not enough stamina"
           
        }
    }
    
    
    
    
    }



    
   




