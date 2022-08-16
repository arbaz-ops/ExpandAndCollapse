//
//  ViewController.swift
//  ExpandAndCollase
//
//  Created by Carbonic-IT on 16/08/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, Delegate {
    var expandedCells = [Bool]()
    func expandTapped(indexPath: IndexPath) {
        if expandedCells[indexPath.row] == true {
            expandedCells[indexPath.row] = false
            DispatchQueue.main.async {[self] in
                myTableView.reloadRows(at: [indexPath], with: .fade)
                myTableView.scrollToRow(at: indexPath, at: .middle, animated: true)
            }
            
            
        }
        else {
            expandedCells[indexPath.row] = true
            DispatchQueue.main.async {[self] in
                myTableView.reloadRows(at: [indexPath], with: .fade)
                myTableView.scrollToRow(at: indexPath, at: .middle, animated: true)
            }
        }
    }
    
    
    let colors = [UIColor.red,UIColor.blue,UIColor.brown, UIColor.cyan, UIColor.darkGray, UIColor.green, UIColor.orange, UIColor.purple]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        _expandedCells[indexPath] = _expandedCells[indexPath] == nil ? true : !_expandedCells[indexPath]!
//
//        tableView.reloadRows(at: [indexPath], with: .fade)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? CustomTableViewCell else { return }
        let isExpanded = expandedCells[indexPath.row]

           cell.set(expanded: isExpanded)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as? CustomTableViewCell
        cell?.backgroundColor = colors[indexPath.row]
        cell?.delegate = self
        cell?.indexPath = indexPath
        cell?.cellNumberLabel.text = "\(indexPath.row)"
        print(cell?.frame.size)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as? CustomTableViewCell
        return expandedCells[indexPath.row] == false ? 101 / 2 : expandedCells[indexPath.row] ? 101 : 101 / 2

    }
    

    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        expandedCells = Array(repeating: false, count: colors.count)
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.register(UINib.init(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
        // Do any additional setup after loading the view.
    }


}

