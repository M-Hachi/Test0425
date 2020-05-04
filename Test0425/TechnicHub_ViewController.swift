// Created 2020/05/03
// Using Swift 5.0

import UIKit

class TechnicHub_ViewController: UIViewController {

    var segueText: String?
    var HubName: String?
    var HubId: Int = -1
    
    @IBOutlet weak var HubName_Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HubName_Label.text = HubName
        
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
