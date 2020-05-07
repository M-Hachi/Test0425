//
//  ViewController.swift
//  Test0425
//

import UIKit
import ControlFunc_Framework
import CoreBluetooth

public let NUMBEROFHUBS:Int = 10
public var BLEMANAGER = BLEManager(NumberOfHubs: NUMBEROFHUBS)

class ViewController: UIViewController{
    var handler: CustomTable!
    
    @IBOutlet weak var TableView: UITableView!
    
    
    let Hubs = ["zero", "one", "two", "three", "four","five","six","seven","eight","nine"]
    
    override func viewDidLoad() {
        print("view did load")
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        BLEMANAGER = BLEManager.init(NumberOfHubs: NUMBEROFHUBS)//使用前に必ずinit()を呼ぶ
        
        //let segue=UIStoryboardSegue(identifier:"SegueToSBalt", source: self, destination:ViewController_Alt())
        
        handler = CustomTable(inputData: Hubs, ViewController: self, TableView: TableView, blemanager: BLEMANAGER)
        
        let Hub1 = BLEMANAGER.BLEHub[0]
        
    }
    
}
extension ViewController{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("will prepare3")
        if segue.identifier == "Segue_TechnicHub" {
            print("TechincHub")
            //guard let vc = segue.destination as? ViewController_Alt else { return }// as? (class名) StoryboardでviewcontrollerのStoryboardIDを指定する
            guard let vc = segue.destination as? TechnicHub_ViewController else { return }//
            //vc.segueText = "did segue!3"
            vc.HubId = handler.HubId
            vc.HubName = "Hub \(handler.HubId)"
        }
        else if segue.identifier == "Segue_TrainHub" {
            print("TrainHub")
            //guard let vc = segue.destination as? ViewController_Alt else { return }// as? (class名) StoryboardでviewcontrollerのStoryboardIDを指定する
            guard let vc = segue.destination as? TrainHub_ViewController else { return }//
            //vc.segueText = "did segue!3"
            vc.HubId = handler.HubId
            vc.HubName = "Hub \(handler.HubId)"
        }
    }
    
}
