//
//  RecommendHostsTableViewController.swift
//  fastbnb
//
//  Created by wonsik on 05/12/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit

class RecommendHostsViewController: UIViewController{
    
    @IBAction func pageGo(_ sender: UIButton) {
        UIApplication.shared.openURL(NSURL(string: "https://www.airbnb.co.kr/help/article/1129/host-referral-program-terms-and-conditions---referring-host?ibbe=0")! as URL)
    }
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        tableView.rowHeight = 70
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.tableFooterView = UIView(frame: .zero)
    }
    let data = RecommendHostsData()
}

extension RecommendHostsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RecommendHostsCell
        let list = self.data.list[indexPath.row]
        cell.title?.text = list.title
        cell.icon?.image = UIImage(named: list.icon)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        NSLog("선택된행은 \(indexPath.row) 번째 행입니다")
        
        switch indexPath.row {
        case 0: self.performSegue(withIdentifier: "a", sender: nil)
            
        default:
            return
        }
        
    }
}
