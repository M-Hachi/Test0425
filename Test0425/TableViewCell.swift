// Created 2020/04/29
// Using Swift 5.0

import Foundation
import UIKit
import ControlFunc_Framework

class CustomSwitch: UISwitch{
    var index:Int
    var ViewController: UIViewController
    var blemanager: BLEManager
   
    @objc func toggle(_ sender: UISwitch) {
        if sender.isOn{
            print("on \(self.index)")
            blemanager.Toggle_On(SwiftView: self.ViewController, SwiftSwitch: self, HubId: self.index)
        } else {
            print("off \(self.index)")
            blemanager.Toggle_Off(SwiftView: self.ViewController, SwiftSwitch: self, hub: blemanager.BLEHub[self.index])
        }
    }
    
    init(index: Int, ViewController: UIViewController, blemanager: BLEManager){
        self.index=index
        self.ViewController = ViewController
        self.blemanager = blemanager
        super.init(frame: CGRect())
        self.addTarget(self, action: #selector(toggle), for: .valueChanged)
        print("switch \(self.index) to \(blemanager.BLEHub[self.index].isconnected)")
        self.setOn(blemanager.BLEHub[self.index].isconnected, animated: false)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class CustomTable :NSObject, UITableViewDataSource, UITableViewDelegate{
    var HubNames : [String]
    var HubId: Int = -1
    var ViewController: UIViewController
    var blemanager: BLEManager
    let hubs: [Hub]
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("number of rows: \(self.HubNames.count)")
        return self.HubNames.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell0", for: indexPath)
        cell.textLabel?.text = HubNames[indexPath.row]
        cell.accessoryView = CustomSwitch(index: indexPath.row, ViewController: self.ViewController, blemanager: self.blemanager)

        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)番目の行が選択されました。")
        //if(blemanager.BLEStatus.IsConnected[indexPath.row]){
        if(self.hubs[indexPath.row].isconnected){
            self.HubId=indexPath.row
            switch blemanager.BLEHub[indexPath.row].manufacturerdata.SystemTypeAndDeviceNumber {
            case 65:
                self.ViewController.performSegue(withIdentifier: "Segue_TrainHub", sender: self)
            case 128:
                self.ViewController.performSegue(withIdentifier: "Segue_TechnicHub", sender: self)
            default:
                print("unknown hub type!")
            }
        }
    }
    
    public init(hubs: [Hub], ViewController: UIViewController, TableView: UITableView, blemanager: BLEManager) {
        //public init(inputData: [String], ViewController: UIViewController, givensegue:UIStoryboardSegue, TableView: UITableView, blemanager: BLEManager) {
        print("public init")
        self.hubs = hubs
        self.HubNames =  [String](repeating: "noName", count: hubs.count)
        for i in 0 ..< hubs.count {
            self.HubNames[i] = hubs[i].Name
        }
        self.ViewController = ViewController
        self.blemanager = blemanager
        
        super.init()
        TableView.dataSource = self
        TableView.delegate = self
    }
    @objc func segue(){
        self.ViewController.performSegue(withIdentifier: "SegueToSBalt", sender: self)
    }
}
