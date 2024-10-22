//
//  ViewController.swift
//  CLickerApp
//
//  Created by RYAN STARK on 9/24/24.
//
class Info{
    static var states = [SaveStates]()
    static var scrapp = 0
    static var moneyy = 0
    static var worth = 1
    static var name = "Joe"
    static var image = "ship"
    static var blowup = false
    
}

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrapPicture: UIImageView!
    @IBOutlet weak var scrapAmount: UILabel!
    @IBOutlet weak var moneyAmount: UILabel!
    @IBOutlet weak var stunImage: UIImageView!
    @IBOutlet weak var stunThing: UIButton!
    @IBOutlet weak var employeeLabel: UILabel!
    
    var money = 0
    var scrap = 0
    var blowup = false
    var image = ""
    
    var encoder = JSONEncoder()
    var decoder = JSONDecoder()
    var defaults = UserDefaults.standard
    
    var addAmount = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        blowup = defaults.bool(forKey: "blowup")
        if !blowup {
            stunImage.isHidden = true
            stunThing.isEnabled = false
        }
        Info.moneyy = defaults.integer(forKey: "money")
        Info.scrapp = defaults.integer(forKey: "scrap")
        if defaults.integer(forKey: "worth") != 0 {
            Info.worth = defaults.integer(forKey: "worth")
        } else {Info.worth=1}
        if defaults.string(forKey: "name") != nil {
            Info.name = defaults.string(forKey: "name")!
            employeeLabel.text = "Employee: \(Info.name)"
        }
        if defaults.string(forKey: "picture") != nil{
            let pic = defaults.string(forKey: "picture")
            scrapPicture.image = UIImage(named: pic!)
        }
        
        
        if Info.name == "Joe" {
            name(alertName: "Whats your name")

        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        money = Info.moneyy
        scrap = Info.scrapp
        image = Info.image
        blowup = Info.blowup
        image = Info.image
        blowup = Info.blowup
        scrapAmount.text = "Scrap: \(scrap)"
        moneyAmount.text = "Money: \(money)"

    }

    @IBAction func scrappedTapped(_ sender: UIButton) {
        if !blowup{
            scrap = scrap + addAmount
            scrapAmount.text = "Scrap: \(scrap)"
            rollScrap()
        } else {
            scrap = 0
            scrapAmount.text = "Scrap: \(scrap)"
            scrapPicture.image = UIImage(named: "ship")
            image = "ship"
            blowUped(alertName: "Oops u hit a landmine, you lost all your scrap")
            stunImage.isHidden = true
            stunThing.isEnabled = false
            blowup = false
        }
        

    }
    
    @IBAction func stunButton(_ sender: UIButton) {
        blowup = false
        rollScrap()
        stunImage.isHidden = true
        stunThing.isEnabled = false
        scrap += 10
        scrapAmount.text = "Scrap \(scrap)"
    }
    
    
    
    func rollScrap(){
        var random = Int.random(in: 0...14)
        let another = Int.random(in: 1...50)
        if another == 1 {
            random = 15
        }
//        print(random)
        switch random{
        case 0: scrapPicture.image = UIImage(named: "Airhorn")
            image = "Airhorn"
        case 1: scrapPicture.image = UIImage(named: "BeehiveIcon")
            image = "BeehiveIcon"
        case 2: scrapPicture.image = UIImage(named: "Bell")
            image = "Bell"
        case 3: scrapPicture.image = UIImage(named: "BigBoltIcon")
            image = "BigBoltIcon"
        case 4: scrapPicture.image = UIImage(named: "Bottles")
            image = "Bottles"
        case 5: scrapPicture.image = UIImage(named: "Candy")
            image = "Candy"
        case 6: scrapPicture.image = UIImage(named: "Clown")
            image = "Clown"
        case 7: scrapPicture.image = UIImage(named: "Comedy_mask")
            image = "Comedy_mask"
        case 8: scrapPicture.image = UIImage(named: "coookie")
            image = "coookies"
        case 9: scrapPicture.image = UIImage(named: "Egg_beater")
            image = "Egg_beater"
        case 10: scrapPicture.image = UIImage(named: "Fancy_lamp")
            image = "Fancy_lamp"
        case 11: scrapPicture.image = UIImage(named: "Flask")
            image = "Flask"
        case 12: scrapPicture.image = UIImage(named: "Hair_dryer")
            image = "Hair_dryer"
        case 13: scrapPicture.image = UIImage(named: "Large_axlepng")
            image = "Large_axlepng"
        case 14: scrapPicture.image = UIImage(named: "Apparatus")
            image = "Apparatus"
        default: scrapPicture.image = UIImage(named: "landmine")
            image = "landmine"
            blowup = true
            stunImage.isHidden = false
            stunThing.isEnabled = true
        }
    }
    
    @IBAction func selectGame(_ sender: Any) {
        Info.states.append(SaveStates(money: money, scrap: scrap, worth: Info.worth, image: image, name: Info.name, blowup: blowup))
        performSegue(withIdentifier: "games", sender: nil)
    }
    
    
    
    func blowUped(alertName: String)
        {
            let alert = UIAlertController(title: "Boom", message: alertName, preferredStyle: UIAlertController.Style.alert)
            let alertAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
            
            alert.addAction(alertAction)
            
            self.present(alert, animated: true)
            
        }
    
    func restart(alertName: String){
        let alert = UIAlertController(title: "Restart", message: alertName, preferredStyle: UIAlertController.Style.alert)
        let yesAction = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default) {(action) in
            Info.moneyy = self.money
            Info.scrapp = self.scrap
            Info.image = self.image
            Info.blowup = self.blowup
            Info.states.append(SaveStates(money: Info.moneyy, scrap: Info.scrapp, worth: Info.worth, image: Info.image, name: Info.name, blowup: Info.blowup))
            Info.moneyy = 0
            self.money = 0
            Info.scrapp = 0
            self.scrap = 0
            Info.worth = 1
            Info.name = "Joe"
            self.image = "ship"
            self.blowup = false
            self.stunImage.isHidden = true
            self.stunThing.isEnabled = false
            self.scrapAmount.text = "Scrap: 0"
            self.moneyAmount.text = "Money: 0"
            self.scrapPicture.image = UIImage(named: self.image)
            self.name(alertName: "Whats your name")
            self.employeeLabel.text = "Employee: None"
        }
        let noAction = UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: nil)
        
        alert.addAction(yesAction)
        alert.addAction(noAction)
        
        self.present(alert, animated: true)
        
    }
    
    func name(alertName: String){
        let alert = UIAlertController(title: "Contract", message: alertName, preferredStyle: UIAlertController.Style.alert)
        alert.addTextField { (textField) in
            textField.text = ""
        }
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0] // Force unwrapping because we know it exists.
            Info.name = textField!.text!
            self.employeeLabel.text = "Employee: \(Info.name)"
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nvc = segue.destination as! ShopViewController
        Info.scrapp = scrap
        Info.moneyy = money
        nvc.scrap = scrap
        nvc.money = money
    }
    
    @IBAction func newGame(_ sender: Any) {
        restart(alertName: "Restart?")
    }
    
    @IBAction func saveButton(_ sender: Any) {
        defaults.set(money, forKey: "money")
        defaults.set(scrap, forKey: "scrap")
        defaults.set(image, forKey: "picture")
        defaults.set(Info.worth, forKey: "worth")
        defaults.set(blowup, forKey: "blowup")
        defaults.set(Info.name, forKey: "name")
    }
    
    
}
    
    



    

