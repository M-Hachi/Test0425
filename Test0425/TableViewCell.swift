// Created 2020/04/29
// Using Swift 5.0

import Foundation
import UIKit



class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        let switchView = UISwitch(frame: .zero)
        switchView.setOn(false, animated: false)
        switchView.addTarget(self, action: #selector(valueChanged), for: .valueChanged)
        accessoryView = switchView

    }
    @objc func valueChanged(sender: UISwitch) {
        print((textLabel?.text ?? "") + " switch is " + (sender.isOn ? "ON" : "OFF"))
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
