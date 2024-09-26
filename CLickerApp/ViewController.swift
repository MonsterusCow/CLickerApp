//
//  ViewController.swift
//  CLickerApp
//
//  Created by RYAN STARK on 9/24/24.
//
class Info{
    static var scrapp = 0
    static var moneyy = 0
}
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrapPicture: UIImageView!
    @IBOutlet weak var scrapAmount: UILabel!
    @IBOutlet weak var moneyAmount: UILabel!
    var money = 0
    var scrap = 0
    var blowup = false
    @IBOutlet weak var stunImage: UIImageView!
    @IBOutlet weak var stunThing: UIButton!
    
    var addAmount = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stunImage.isHidden = true
        stunThing.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        money = Info.moneyy
        scrap = Info.scrapp
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
    }
    
    
    
    func rollScrap(){
        var random = Int.random(in: 0...14)
        var another = Int.random(in: 1...50)
        if another == 1 {
            random = 15
        }
        print(random)
        switch random{
        case 0: scrapPicture.image = UIImage(named: "Airhorn")
        case 1: scrapPicture.image = UIImage(named: "BeehiveIcon")
        case 2: scrapPicture.image = UIImage(named: "Bell")
        case 3: scrapPicture.image = UIImage(named: "BigBoltIcon")
        case 4: scrapPicture.image = UIImage(named: "Bottles")
        case 5: scrapPicture.image = UIImage(named: "Candy")
        case 6: scrapPicture.image = UIImage(named: "Clown")
        case 7: scrapPicture.image = UIImage(named: "Comedy_mask")
        case 8: scrapPicture.image = UIImage(named: "coookie")
        case 9: scrapPicture.image = UIImage(named: "Egg_beater")
        case 10: scrapPicture.image = UIImage(named: "Fancy_lamp")
        case 11: scrapPicture.image = UIImage(named: "Flask")
        case 12: scrapPicture.image = UIImage(named: "Hair_dryer")
        case 13: scrapPicture.image = UIImage(named: "Large_axlepng")
        case 14: scrapPicture.image = UIImage(named: "Apparatus")
        default: scrapPicture.image = UIImage(named: "landmine")
            blowup = true
            stunImage.isHidden = false
            stunThing.isEnabled = true
        }
    }
    func blowUped(alertName: String)
        {
            let alert = UIAlertController(title: "Boom", message: alertName, preferredStyle: UIAlertController.Style.alert)
            let alertAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
            
            alert.addAction(alertAction)
            
            self.present(alert, animated: true)
            
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var nvc = segue.destination as! ShopViewController
        Info.scrapp = scrap
        Info.moneyy = money
        nvc.scrap = scrap
        nvc.money = money
    }
    

}

