// Created 2020/04/29
// Using Swift 5.0

import Foundation
import UIKit

class CustomSwitch: UISwitch{
    var index:Int
    var ViewController: UIViewController
    @objc func toggle(_ sender: UISwitch) {
        if sender.isOn{
            print("on \(self.index)")
            status[self.index]=true
            blemanager.Toggle_On(SwiftView: self.ViewController, SwiftSwitch: self, HubId: self.index)
        } else {
            print("off \(self.index)")
            status[self.index]=false
            blemanager.Toggle_Off(SwiftView: self.ViewController, SwiftSwitch: self, HubId: self.index)
        }
    }
    init(index: Int, ViewController: UIViewController){
        self.index=index
        self.ViewController = ViewController
        super.init(frame: CGRect())
        self.addTarget(self, action: #selector(toggle), for: .valueChanged)
        print("switch \(self.index) to \(status[self.index])")
        self.setOn(status[self.index], animated: false)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class CustomTable :NSObject, UITableViewDataSource, UITableViewDelegate{
    var Hubs: [String]
    var HubId: Int = -1
    var ViewController: UIViewController
    //var SegueToHubDetails : UIStoryboardSegue
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.Hubs.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell0", for: indexPath)
        cell.textLabel?.text = Hubs[indexPath.row]
        cell.accessoryView = CustomSwitch(index: indexPath.row, ViewController: self.ViewController)

        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)番目の行が選択されました。")
        self.HubId=indexPath.row
        segue()
    }
    
    public init(inputData: [String], ViewController: UIViewController, givensegue:UIStoryboardSegue, TableView: UITableView) {
        print("public init")
        self.Hubs = inputData
        self.ViewController = ViewController
        //self.SegueToHubDetails = givensegue
        
        super.init()
        TableView.dataSource = self
        TableView.delegate = self
    }
    @objc func segue(){
        self.ViewController.performSegue(withIdentifier: "SegueToSBalt", sender: self)
    }
}
    



/*
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

public class HubsTableView: UITableViewController{
    let Hubs = ["Uno", "Dos", "Tres", "Cuatro", "Cinco","Seis","Siete"]
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("number of rows")
        return Hubs.count
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell0", for: indexPath)
        // セルに表示する値を設定する
        cell.textLabel?.text = Hubs[indexPath.row]
        
        let switchview:UISwitch = UISwitch(frame: CGRect())
        cell.accessoryView = switchview
        switchview.addTarget(self, action: #selector(toggle), for: .valueChanged)
        switchview.tag = indexPath.row
        switchview.setOn(status[switchview.tag], animated: false)
        
        return cell
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
    
}*/

//class CustomViewTable:UITableView{
/*public class CustomViewTable: NSObject {
    
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
}*/

