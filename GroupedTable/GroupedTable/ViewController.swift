//
//  ViewController.swift
//  GroupedTable
//
//  Created by Yogendra Tandel on 18/08/19.
//  Copyright © 2019 Yogendra Tandel. All rights reserved.
//

import UIKit

struct ButtonInfo {
    let title: String
    let subtitle: [String]

}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    
    @IBOutlet weak var myTV: UITableView!
    
    let mainBtnsArr = [
        
        ButtonInfo(title: "First", subtitle: ["1", "2", "3", "4"]),
        ButtonInfo(title: "Second", subtitle: ["5", "6", "7"]),
        ButtonInfo(title: "Third", subtitle: ["8", "9"]),
        ButtonInfo(title: "Fourth", subtitle: ["10", "11", "12", "13"]),
        ButtonInfo(title: "Fifth", subtitle: ["10"])
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myTV.delegate = self
        myTV.dataSource = self
        myTV.backgroundColor = UIColor.clear
        myTV.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return mainBtnsArr.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(mainBtnsArr[section].title)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainBtnsArr[section].subtitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let grayBox = UIView(frame: CGRect(x: 30, y: 0, width: cell.contentView.frame.width, height: 50))
        grayBox.backgroundColor = UIColor(red:0.90, green:0.90, blue:0.90, alpha:1.0)
        grayBox.layer.cornerRadius = 15
        let totalRows = mainBtnsArr[indexPath.section].subtitle.count
        if totalRows > 1{
            if indexPath.row == 0{
                grayBox.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            }else if (indexPath.row == totalRows - 1){
                grayBox.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            }else{
                grayBox.layer.maskedCorners = []
            }
        }else{
            grayBox.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        }
        grayBox.layer.borderColor = UIColor(red:0.80, green:0.80, blue:0.80, alpha:1.0).cgColor
        grayBox.layer.borderWidth = 1.0
        
        let lbl_Title = UILabel()
        lbl_Title.frame = CGRect(x: 15, y: 10, width: cell.contentView.frame.width - 30, height: 30)
        grayBox.addSubview(lbl_Title)
        lbl_Title.text = "\(mainBtnsArr[indexPath.section].subtitle[indexPath.row])"
        
        cell.contentView.addSubview(grayBox)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    

    

}

