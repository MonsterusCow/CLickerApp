//
//  ViewController.swift
//  CLickerApp
//
//  Created by RYAN STARK on 9/24/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrapPicture: UIImageView!
    @IBOutlet weak var scrapAmount: UILabel!
    @IBOutlet weak var moneyAmount: UILabel!
    var mooney = 0
    var scrap = 0
    
    
    var addAmount = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        scrapAmount.text = "Scrap: \(scrap)"
    }

    @IBAction func cookieTapped(_ sender: UIButton) {
        scrap = scrap + addAmount
        scrapAmount.text = "Scrap: \(scrap)"

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var nvc = segue.destination as! ShopViewController
        nvc.scrap = scrap
        
    }
    
    
    
    

}

