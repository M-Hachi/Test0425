//
//  ViewController.swift
//  Test0425
//

import UIKit
import ControlFunc_Framework
import CoreBluetooth


public var blemanager = BLEManager()
var status=[Bool](repeating: false, count: 10)


class ViewController: UIViewController{
    //UITableViewDelegate, UITableViewDataSource
    //@IBOutlet var TableView = HubsTableView()
    var handler: CustomTable!
    @IBOutlet weak var TableView: UITableView!
    //@IBOutlet var TableView: UITableView!
    
    @IBOutlet weak var Switch0: UISwitch!
    @IBOutlet weak var Switch1: UISwitch!
    
    let Hubs = ["Uno", "Dos", "Tres", "Cuatro", "Cinco","Seis","Siete"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        blemanager = .init()
        //TableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell0")
//        TableView.delegate = self
//        TableView.dataSource = self
        handler = CustomTable(inputData: Hubs)
        TableView.dataSource = handler
        //self.TableView = HubsTableView()
        
        self.Switch0.addTarget(self, action: #selector(Switch0_toggle), for: .valueChanged)
        self.Switch1.addTarget(self, action: #selector(Switch1_toggle), for: .valueChanged)
        
//        for row in 0...Hubs.count{
//            print("row = \(row)")
//            self.switchview[row].addTarget(self, action: #selector(toggle), for: .valueChanged)
//            self.switchview[row].tag = row
//            print("tag = \(self.switchview[row].tag)")
//        }
        //self.Switch2.addTarget(self, action: #selector(Switch2_toggle), for: .valueChanged)
    }
}

extension ViewController{
//extension ViewController :UITableViewDelegate, UITableViewDataSource{
    @objc func Switch0_toggle(_ sender: UISwitch) {
        if( Switch0.isOn ){
            print("Switch0 turned On")
            blemanager.Toggle_On(SwiftView: self, SwiftSwitch: Switch0, HubId: 0)
        }else{
            print("Switch0 turned Off")
            blemanager.Toggle_Off(SwiftView: self, SwiftSwitch: Switch0, HubId: 0)
        }
    }
    @objc func Switch1_toggle(_ sender: UISwitch) {
        if( Switch1.isOn ){
            print("Switch1 turned On")
            blemanager.Toggle_On(SwiftView: self, SwiftSwitch: Switch1, HubId: 1)
        }else{
            print("Switch1 turned Off")
            blemanager.Toggle_Off(SwiftView: self, SwiftSwitch: Switch1, HubId: 1)
        }
    }
    //tableview
    /*
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("number of rows: \(Hubs.count)")
        return Hubs.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell0", for: indexPath)
        // セルに表示する値を設定する
        cell.textLabel?.text = Hubs[indexPath.row]
        
        cell.accessoryView = CustomSwitch(index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
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
    }*/
}

