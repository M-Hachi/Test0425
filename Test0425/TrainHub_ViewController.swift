// Created 2020/05/04
// Using Swift 5.0

import UIKit
import  ControlFunc_Framework

class TrainHub_ViewController: UIViewController {
    
    var segueText: String?
    var hub: Hub?
    var HubName: String?
    var HubId: Int = -1
    
    @IBOutlet weak var HubName_Label: UILabel!
    
    @IBOutlet weak var RSSI_val_Label: UILabel!
    @IBOutlet weak var Battery_val_Label: UILabel!
    
    @IBOutlet weak var HW_B_Label: UILabel!
    @IBOutlet weak var HW_A_Label: UILabel!
    
    var ViewTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ViewTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.UpdateView), userInfo: nil, repeats: true)
        
        HubName_Label.text = HubName
        
        
        //BLEMANAGER.self.HubProperties_Downstream(hub: HubId, HubPropertyReference: 0x05, HubPropertyOperation: 0x05)
        //BLEMANAGER.self.HubProperties_Downstream(hub: HubId, HubPropertyReference: 0x06, HubPropertyOperation: 0x05)
        BLEMANAGER.self.HubProperties_Downstream(hub: hub!, HubPropertyReference: 0x05, HubPropertyOperation: 0x05)
        BLEMANAGER.self.HubProperties_Downstream(hub: hub!, HubPropertyReference: 0x06, HubPropertyOperation: 0x05)
        
    }
    
    @objc func UpdateView(){
        self.RSSI_val_Label.text = String("\(BLEMANAGER.BLEHub[HubId].RSSI) [dB]")
        self.Battery_val_Label.text = String("\(BLEMANAGER.BLEHub[HubId].BatteryVoltage) [%]")
        self.HW_A_Label.text = BLEMANAGER.BLEHub[HubId].attatchedHw.PortA.Name()
        self.HW_B_Label.text = BLEMANAGER.BLEHub[HubId].attatchedHw.PortB.Name()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
