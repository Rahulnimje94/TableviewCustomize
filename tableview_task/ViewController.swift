//
//  ViewController.swift
//  tableview_task
//
//  Created by Anand on 05/02/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import UIKit
import PullToMakeSoup

class ViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var editBtn: UIBarButtonItem!
    
    
    var array = [["image": "bridge", "title": "bridge"], ["image": "green", "title": "Green"], ["image": "nature", "title": "Nature"], ["image": "pexels", "title": "Pexels"], ["image": "thumb", "title": "Thumb"]]

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tableview.addPullToRefresh(PullToMakeSoup(at: .top))  {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in
                self?.tableview.endRefreshing(at: .top)
            }
        }
    }

    
    @IBAction func editButten(_ sender: UIBarButtonItem) {
        
        tableview.isEditing = !tableview.isEditing
        
        switch tableview.isEditing {
        case true:
            editBtn.title = "done"
        case false:
            editBtn.title = "edit"
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = array[sourceIndexPath.row]
        array.remove(at: sourceIndexPath.row)
        array.insert(item, at: destinationIndexPath.row)
    }

     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            array.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        
        let dic = array[indexPath.row]
        
        guard let image = dic["image"], let title = dic["title"] else {
            return cell
        }
        
        cell.backgroundImage.image = UIImage(named: image)
        cell.backgroundLabel.text = title
        
        return cell
    }
    

}
