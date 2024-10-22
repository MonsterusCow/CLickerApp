//
//  ShopViewController.swift
//  CLickerApp
//
//  Created by RYAN STARK on 9/24/24.
//

import UIKit

class ShopViewController: UIViewController {

    var scrap = 0
    var money = 0
    @IBOutlet weak var scrapAmount: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var scrapLabel: UILabel!
    @IBOutlet weak var ringLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrapLabel.text = "Scrap: \(scrap)"
        moneyLabel.text = "Money: \(money)"
        ringLabel.text = "ring this to sell scrap for \(Info.worth)"
    }
    
    @IBAction func ringButton(_ sender: UIButton) {
        print("w\(Info.worth)")
        money = money + (scrap * Info.worth)
        print("m\(money)")
        Info.moneyy = money
        scrap = 0
        Info.scrapp = 0
        scrapLabel.text = "Scrap: \(scrap)"
        moneyLabel.text = "Money: \(money)"
    }
    
    @IBAction func TenButton(_ sender: UIButton) {
        if money >= 10 {
            Info.worth = (Info.worth + 1)
            money = money - 10
            Info.moneyy = money
            moneyLabel.text = "Money: \(money)"
            ringLabel.text = "ring this to sell scrap for \(Info.worth)"
        } else {
            broke(alertName: "You dont have enough money")
        }
    }
    @IBAction func HunButton(_ sender: UIButton) {
        if money >= 100 {
            Info.worth = (Info.worth * 2)
            money = money - 100
            Info.moneyy = money
            moneyLabel.text = "Money: \(money)"
            ringLabel.text = "ring this to sell scrap for \(Info.worth)"
        }else {
            broke(alertName: "You dont have enough money")
        }
    }
    @IBAction func WinButton(_ sender: UIButton) {
        if money >= 0{
            win(alertName: "Wowie \(Info.name) became ceo :) now go touch actual money")
            money = money - 10000
            Info.moneyy = money
            moneyLabel.text = "Money: \(money)"
            let timer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { timer in
                exit(0)
                }

        }else {
            broke(alertName: "You dont have enough money")
        }
    }
    
    func broke(alertName: String)
        {
            let alert = UIAlertController(title: "Not enough money", message: alertName, preferredStyle: UIAlertController.Style.alert)
            let alertAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
            
            alert.addAction(alertAction)
            
            self.present(alert, animated: true)
            
        }
    
    func win(alertName: String)
        {
            let alert = UIAlertController(title: "You Win", message: alertName, preferredStyle: UIAlertController.Style.alert)
            let alertAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
            
            alert.addAction(alertAction)
            
            self.present(alert, animated: true)
            
        }
    

    
    
}
