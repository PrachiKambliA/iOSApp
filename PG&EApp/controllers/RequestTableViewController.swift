//
//  RequestTableViewController.swift
//  PG&EApp
//
//  Created by Nghia Phan on 5/31/20.
//  Copyright © 2020 Infosys. All rights reserved.
//

import UIKit

class RequestTableViewController: UITableViewController {
    
    //MARK: Properties
    
    var requests = [Request]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = #colorLiteral(red: 0.8980392157, green: 0.8980392157, blue: 0.9176470588, alpha: 1)
        // Load the sample requests
        requests = DB.database.getRequests()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return requests.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier
        let cellIdentifier = "RequestTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? RequestTableViewCell else {
            fatalError("The dequeued cell is not an instance of RequestTableViewCell")
        }

        // fetches the appropriate request for the data source layout
        let request = requests[indexPath.row]
        
        cell.idLabel.text = request.id
        cell.typeLabel.text = request.type + ": " + request.subtype
        cell.lanIdLabel.text = "LAN ID: " + request.lanId
        cell.locationLabel.text = "Location: " + request.location
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM yy, HH:mm a"
        cell.dateLabel.text = dateFormatter.string(from: request.date)
        
        cell.statusLabel.text = request.status
        if request.status == "Completed" {
            cell.statusLabel.textColor = #colorLiteral(red: 0.2039215686, green: 0.7803921569, blue: 0.3490196078, alpha: 1)
            cell.statusBar.backgroundColor = #colorLiteral(red: 0.2039215686, green: 0.7803921569, blue: 0.3490196078, alpha: 1)
        } else if request.status == "Delayed" {
            cell.statusLabel.textColor = #colorLiteral(red: 1, green: 0.231372549, blue: 0.1882352941, alpha: 1)
            cell.statusBar.backgroundColor = #colorLiteral(red: 1, green: 0.231372549, blue: 0.1882352941, alpha: 1)
        } else {
            cell.statusLabel.textColor = #colorLiteral(red: 1, green: 0.5843137255, blue: 0, alpha: 1)
            cell.statusBar.backgroundColor = #colorLiteral(red: 1, green: 0.5843137255, blue: 0, alpha: 1)
        }

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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    

}
