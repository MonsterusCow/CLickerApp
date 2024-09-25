//
//  ShopViewController.swift
//  CLickerApp
//
//  Created by RYAN STARK on 9/24/24.
//

import UIKit

class ShopViewController: UIViewController {

    var scrap = 0
    @IBOutlet weak var scrapAmount: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var nvc = segue.destination as! ViewController
        nvc.scrap = scrap
    }
    
}
