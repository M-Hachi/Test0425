// Created 2020/04/29
// Using Swift 5.0

import UIKit

class ViewController_2: UIViewController {
    @IBOutlet weak var Button_1: UIButton!
    @IBOutlet weak var ButtonA: UIButton!
    
    var color:Int=0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.Button_1.addTarget(self, action: #selector(Button_1_Up), for:  .touchUpInside)

        self.ButtonA.addTarget(self, action: #selector(ButtonA_Down), for:  .touchDown)
        self.ButtonA.addTarget(self, action: #selector(ButtonA_Up), for:  .touchUpInside)
        //print("2: \(BLEMANAGER.BLEHub[0].attatchedHw.PortA)")
        
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

extension ViewController_2{
    @objc func Button_1_Up(){
        print("color: \(self.color)")
        BLEMANAGER.SetRgbColorNo(LED_color: self.color, hub: Fire, Port: 0x32, Mode: 0x00)
        color+=1
        if(color>10){
            color=0
        }
        
    }
    
    @objc func ButtonA_Down(){
        //blemanager.HubActions_Downstream(HubId: 0, ActionTypes: 0x01)
        //BLEMANAGER.PortOutputCommand_StartPower(HubId: 0, PortId: 0, StartupInformation: 0x00, CompletetionInformation: 0x00, Power: 100)
        BLEMANAGER.PortOutputCommand_StartPower(hub: Fire, PortId: 0, StartupInformation: 0x00, CompletetionInformation: 0x00, Power: 100)
       
    }
    
    @objc func ButtonA_Up(){
        //blemanager.HubActions_Downstream(HubId: 0, ActionTypes: 0x01)
        //BLEMANAGER.PortOutputCommand_StartPower(HubId: 0, PortId: 0, StartupInformation: 0x00, CompletetionInformation: 0x00, Power: 0)
        BLEMANAGER.PortOutputCommand_StartPower(hub: Fire, PortId: 0, StartupInformation: 0x00, CompletetionInformation: 0x00, Power: 0)
    }
}
