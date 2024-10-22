//
//  TableViewController.swift
//  StarkClassmates
//
//  Created by RYAN STARK on 10/9/24.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    
    @IBOutlet weak var tableViewThing: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableViewThing.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Info.states.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellBeHere") as! CellStuff
        cell.configure(Name: Info.states[indexPath.row].name)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Info.moneyy = Info.states[indexPath.row].money
        Info.scrapp = Info.states[indexPath.row].scrap
        Info.worth = Info.states[indexPath.row].worth
        Info.image = Info.states[indexPath.row].image
        Info.blowup = Info.states[indexPath.row].blowup
        Info.name = Info.states[indexPath.row].name
        performSegue(withIdentifier: "goback", sender: nil)
    }
//
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            thing.students.remove(at: indexPath.row)
//            tableViewThing.deleteRows(at: [indexPath], with: .fade)
//        }
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var nvc = segue.destination as? ViewController
        nvc?.employeeLabel.text = "Employee: \(Info.name)"
        nvc?.scrapPicture.image = UIImage(named: Info.image)
        nvc?.moneyAmount.text = "Money: \(Info.moneyy)"
        nvc?.scrapAmount.text = "Scrap: \(Info.scrapp)"
        if Info.blowup {
            nvc?.stunThing.isEnabled = true
            nvc?.stunImage.isHidden = false
        } else {
            nvc?.stunThing.isEnabled = false
            nvc?.stunImage.isHidden = true
        }
    }

    
}
