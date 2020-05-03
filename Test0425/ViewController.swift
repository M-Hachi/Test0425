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
    var handler: CustomTable!
    
    @IBOutlet weak var TableView: UITableView!
    
    
    let Hubs = ["zero", "one", "two", "three", "four","five","six","seven","eight","nine"]
    
    override func viewDidLoad() {
        print("view did load")
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        blemanager = BLEManager.init()
        
        let segue=UIStoryboardSegue(identifier:"SegueToSBalt", source: self, destination:ViewController_Alt())
        
        handler = CustomTable(inputData: Hubs, ViewController: self, givensegue: segue, TableView: TableView)
        
        
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        if segue.identifier == "SegueToSBalt" {
    //            print("ifprepare2")
    //            guard let vc = segue.destination as? ViewController_Alt else { return }// as? (class名) StoryboardでviewcontrollerのStoryboardIDを指定する
    //            vc.segueText = "did segue!"
    //        }
    //    }
}
extension ViewController{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("will prepare3")
        if segue.identifier == "SegueToSBalt" {
            print("ifprepare3")
            guard let vc = segue.destination as? ViewController_Alt else { return }// as? (class名) StoryboardでviewcontrollerのStoryboardIDを指定する
            //vc.segueText = "did segue!3"
            vc.HubId = handler.HubId
        }
    }
   
}
