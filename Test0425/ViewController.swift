//
//  ViewController.swift
//  Test0425
//
//  Created by 森内　映人 on 2020/04/25.
//  Copyright © 2020 森内　映人. All rights reserved.
//

import UIKit
import ControlFunc_Framework
import CoreBluetooth

class ViewController: UIViewController {
    @IBOutlet var Switch1: UISwitch!
    //var BLE = BLEManager()
    var HubManager = LegoHubManager()
    
    @IBAction func Switch1_toggle(_ sender: UISwitch) {
        if( Switch1.isOn ){
            print("Switch1 turned On")
            //HubManager.alert_hub(SwiftView: self,Swift No: 1)
            HubManager.alert_hub(SwiftView: self, SwiftSwitch: Switch1, No: 1)
            //alert_hub(No: 1)
            connection.No=1
            HubManager.centralManager.scanForPeripherals(withServices: [legohubServiceCBUUID])
        }else{
            print("Switch1 turned Off")
            if(connection.Status[1]==1){
                connection.Status[1]=0
                print("Hub1 turn Off Action")
                HubActions_Downstream(HubId: 1, ActionTypes: 0x01)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("A \(DtoUInt8(double: 100))")
    }
    
    
    
    var alert: UIAlertController!
    func alert_hub(No:Int) {
        alert = UIAlertController(title: "Scanning...", message: "Press button on hub \(No).", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:{
            (action: UIAlertAction!) -> Void in
            //Cancelが押された時の処理
            print("Switch turned Off")
        
            //self.BLE.centralManager.stopScan()
            //self.centralManager.stopScan()
            if(connection.No==0){
                //self.Switch0.setOn(false, animated: true)
            }else if(connection.No==1){
                self.Switch1.setOn(false, animated: true)
            }else if(connection.No==2){
                //self.Switch2.setOn(false, animated: true)
            }else if(connection.No==3){
                //self.Switch3.setOn(false, animated: true)
            }else{
                print("error on .cancel of alert")
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    func closeAlert() {
        alert.dismiss(animated: true, completion: nil)
    }
}

