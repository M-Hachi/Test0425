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
        
        handler = CustomTable(hubs:Hubs, ViewController: self, TableView: TableView, blemanager: BLEMANAGER)
        BLEMANAGER.delegate = self
    }
}

extension ViewController{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("will prepare3")
        if segue.identifier == "Segue_TechnicHub" {
            print("TechincHub")
            // as? (class名) StoryboardでviewcontrollerのStoryboardIDを指定する
            guard let vc = segue.destination as? TechnicHub_ViewController else { return }
            vc.hub = Hubs[handler.HubId]
            vc.HubId = handler.HubId
            vc.HubName = "Hub \(handler.HubId)"
        }
        else if segue.identifier == "Segue_TrainHub" {
            print("TrainHub")
            // as? (class名) StoryboardでviewcontrollerのStoryboardIDを指定する
            guard let vc = segue.destination as? TrainHub_ViewController else { return }
            vc.hub = Hubs[handler.HubId]
            vc.HubId = handler.HubId
            vc.HubName = "Hub \(handler.HubId)"
        }
    }
}

extension ViewController: BLEManagerDelegate{
    func didDetatchPort(_ hub: Hub, _ port: HubPort) {
        print("didDetatchPort view")
    }
    func didAttatchPort(_ hub: Hub) {
         print("didAttatchport view")
    }
    
    func didAttatchVirtualPort(_ hub: Hub) {
         print("didAttatchVirtulport")
    }
    
    func didConnecttoHub(_ hub: Hub) {
        print("didConnecttoHub view")
        BLEMANAGER.SetRgbColorNo(LED_color: hub.id+1, hub: hub, Port: 0x32, Mode: 0x00)
        //synthesizer.speak(utterance_DidConnect)
        
        switch hub {
        case Fire:
            print("hub 0")
        default:
            print("hub 1")
        }
    }
}
