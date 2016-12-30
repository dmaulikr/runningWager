//
//  WagersTableViewController.swift
//  RunningWager
//
//  Created by Zach Johnson on 11/26/16.
//  Copyright © 2016 Zach Johnson. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class WagersTableViewController: UITableViewController {

    
    var dbRef: FIRDatabaseReference!
    var bets = [Bet]()
    
    @IBOutlet var newBetView: UIView!
    @IBOutlet weak var distance: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    
    @IBAction func addWager(_ sender: AnyObject) {
        
        self.view.addSubview(newBetView)
        newBetView.center = self.view.center
        
    }
    
    
    @IBAction func submitBet(_ sender: AnyObject) {
        
        let distance = Int(self.distance.text!)
        let time = Int(timeTextField.text!)
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        let result = formatter.string(from: date)
        
        let newBet = Bet(addedByUser: Model.name, distance: distance!, time: time!, date: result)
        
        
        self.newBetView.removeFromSuperview()
        
        let newDbRef = Model.dbRef.child("bets").child(String(describing: date))
        
        newDbRef.setValue(newBet.toAnyObject())
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())

        
        
        print("hello I am here 1")
        
        startObservingDB()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func startObservingDB() {
        
        print("hello I am here 2")
        
        Model.dbRef.child("bets").observe(.value, with: { (snapshot: FIRDataSnapshot) in
            
            
            var newBets = [Bet]()
            
            var i = 0
            
            print("hello I am here 3")
            for bet in snapshot.children {
                let betObject = Bet(snapshot: bet as! FIRDataSnapshot)
                newBets.append(betObject)
                i = i + 1
                print("we are on number \(i)")
            }
            
            self.bets = newBets
            self.tableView.reloadData()
            
        })
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return bets.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cells", for: indexPath)

        let bet = bets[indexPath.row]
        
        cell.textLabel?.text = "\(bet.distance) miles at a \(bet.time) pace"
        cell.detailTextLabel?.text = "\(bet.date) by \(bet.addedByUser)"

        return cell
    }
    
    
    
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


