// Created 2020/04/29
// Using Swift 5.0

import UIKit

class ViewController_2: UIViewController {
    @IBOutlet weak var Button_1: UIButton!
    @IBOutlet weak var ButtonA: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.ButtonA.addTarget(self, action: #selector(ButtonA_Down), for:  .touchDown)
        self.ButtonA.addTarget(self, action: #selector(ButtonA_Up), for:  .touchUpInside)
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
    @objc func ButtonA_Down(){
        //blemanager.HubActions_Downstream(HubId: 0, ActionTypes: 0x01)
        blemanager.PortOutputCommand_StartPower(HubId: 0, PortId: 0, StartupInformation: 0x00, CompletetionInformation: 0x00, Power: 100)
       
    }
    @objc func ButtonA_Up(){
        //blemanager.HubActions_Downstream(HubId: 0, ActionTypes: 0x01)
        blemanager.PortOutputCommand_StartPower(HubId: 0, PortId: 0, StartupInformation: 0x00, CompletetionInformation: 0x00, Power: 0)
    }
}
