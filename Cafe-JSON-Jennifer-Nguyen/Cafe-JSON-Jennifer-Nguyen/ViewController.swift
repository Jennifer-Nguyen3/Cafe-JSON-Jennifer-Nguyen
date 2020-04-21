//
//  ViewController.swift
//  Cafe-JSON-Jennifer-Nguyen
//
//  Created by Jennifer Nguyen on 4/20/20.
//  Copyright © 2020 Jennifer Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
// create a datastructure that is going to put all the cafes together as an array
    var cafes = [Cafe]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadData()
        tableView.delegate = self
        tableView.dataSource = self
    }

    func loadData() {
        //create path
        let path = Bundle.main.path(forResource: "cafes_sf", ofType: "json")
        
        let url = URL (fileURLWithPath: path!)
        
        do {
            let data = try Data(contentsOf: url)
            self.cafes = try JSONDecoder().decode([Cafe].self, from: data)
            
            //test if I can read the cafe information correctly
            for eachCafe in self.cafes {
                print(eachCafe.BUSNAME)
            }
        }
        catch {
            print ("Error: \(error.localizedDescription)")
        }
    }
    

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cafes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = cafes[indexPath.row].BUSNAME
        cell.detailTextLabel?.text = cafes[indexPath.row].STREET
        return cell
    }
}


