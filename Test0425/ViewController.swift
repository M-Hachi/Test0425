//
//  ViewController.swift
//  Test0425
//

import UIKit
import ControlFunc_Framework
import CoreBluetooth

class ViewController: UIViewController {
    @IBOutlet var Switch1: UISwitch!
    public var BLEManager = HubBLEManager()
    //public var StatusManager = HubStatusManager()
    
    @IBAction func Switch1_toggle(_ sender: UISwitch) {
        if( Switch1.isOn ){
            print("Switch1 turned On")
            BLEManager.alert_hub(SwiftView: self, SwiftSwitch: Switch1, No: 1)
            BLEManager.ConnectionStatus.No=1
            print("\(legohubServiceCBUUID)")
            
            BLEManager.centralManager.scanForPeripherals(withServices: [legohubServiceCBUUID])
        }else{
            print("Switch1 turned Off")
            /*if(connection.Status[1]==1){
                connection.Status[1]=0
                print("Hub1 turn Off Action")
                HubActions_Downstream(HubId: 1, ActionTypes: 0x01)
            }*/
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("A \(DtoUInt8(double: 100))")
    }
    
}

