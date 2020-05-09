//
//  ViewController.swift
//  Test0425
//

import UIKit
import ControlFunc_Framework
import CoreBluetooth

public let NUMBEROFHUBS:Int = 10


//public let Hub0 = BLEMANAGER.BLEHub[0]
public let Fire = Hub(Name: "Ta")//アプリで表示される名前
public let Water = Hub(Name: "Ga")
public let Air = Hub(Name: "Le")
public let Stone = Hub(Name: "Po")
public let Earth = Hub(Name: "Onu")
public let Ice = Hub(Name: "Ko")

public let Jan = Hub(Name: "Jan")
public let Feb = Hub(Name: "Feb")
public let Mar = Hub(Name: "Mar")
public let Apr = Hub(Name: "Apr")
public let May = Hub(Name: "May")

public let Hubs = [Fire, Water, Air, Stone, Earth, Ice, Jan, Feb, Mar, Apr, May]

public var BLEMANAGER = BLEManager(hubs: Hubs)
class ViewController: UIViewController{
    var handler: CustomTable!
    
    @IBOutlet weak var TableView: UITableView!
    
    override func viewDidLoad() {
        print("view did load")
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        BLEMANAGER = BLEManager.init(hubs: Hubs)//使用前に必ずinit()を呼ぶ
        //BLEMANAGER.appendhub(hub: Hub0)
        //let segue=UIStoryboardSegue(identifier:"SegueToSBalt", source: self, destination:ViewController_Alt())
        
        handler = CustomTable(hubs:Hubs, ViewController: self, TableView: TableView, blemanager: BLEMANAGER)
        
        
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
            vc.hub = Hubs[handler.HubId]
            vc.HubId = handler.HubId
            vc.HubName = "Hub \(handler.HubId)"
        }
        else if segue.identifier == "Segue_TrainHub" {
            print("TrainHub")
            //guard let vc = segue.destination as? ViewController_Alt else { return }// as? (class名) StoryboardでviewcontrollerのStoryboardIDを指定する
            guard let vc = segue.destination as? TrainHub_ViewController else { return }//
            //vc.segueText = "did segue!3"
            vc.hub = Hubs[handler.HubId]
            vc.HubId = handler.HubId
            vc.HubName = "Hub \(handler.HubId)"
        }
    }
    
}
