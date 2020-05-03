// Created 2020/05/02
// Using Swift 5.0

import UIKit

class ViewController_Alt: UIViewController {
    
    @IBOutlet weak var TextLabel: UILabel!
    var segueText: String?
    var HubId: Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let text = "Showing data for Hub:\(HubId)"
        TextLabel.text = text
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
