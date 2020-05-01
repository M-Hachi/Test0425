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

//class CustomViewTable:UITableView{
public class CustomViewTable: NSObject {
    
    let Hubs = ["Uno", "Dos", "Tres", "Cuatro", "Cinco","Seis","Siete"]
}

extension CustomViewTable: UITableViewDelegate, UITableViewDataSource {
    //tableview
    //    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //        print("number of rows: \(Hubs.count)")
    //        return 7
    //    }
    //var cell = [UITableViewCell](repeating: UITableViewCell(), count: 10)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell0", for: indexPath)
        // セルに表示する値を設定する
        cell.textLabel?.text = Hubs[indexPath.row]
        return cell
    }
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        print("will display cell \(indexPath.row)")
        
        let switchview:UISwitch = UISwitch(frame: CGRect())
        cell.accessoryView = switchview
        switchview.addTarget(self, action: #selector(toggle), for: .valueChanged)
        switchview.tag = indexPath.row
        switchview.setOn(status[switchview.tag], animated: false)
    }
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
           // アクションを実装
         print("\(indexPath.row)番目の行が選択されました。")
    }
    
    @objc func toggle(_ sender: UISwitch) {
        if sender.isOn{
            print("on \(sender.tag)")
            status[sender.tag]=true
        } else {
            print("off \(sender.tag)")
            status[sender.tag]=false
        }
    }
}

