//
//  MainListVc.swift
//  ThirdPartyControls
//
//  Created by Satya on 29/08/18.
//  Copyright © 2018 Hiddenbrains. All rights reserved.
//

import UIKit

class MainListVc: UIViewController {
    @IBOutlet weak var tblControls: UITableView!
    var arrControls = [[String : Any]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblControls.reloadData()
        self.tblControls.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


extension MainListVc: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrControls.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        if( !(cell != nil))
        {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        }
        cell?.textLabel?.text = self.arrControls[indexPath.row]["Title"] as? String
        cell?.accessoryType = .disclosureIndicator
        return cell!

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let screenName = self.arrControls[indexPath.row]["ScreenName"] as? String ?? ""
        if screenName == "MainListVc" {
            let vc = MainListVc(nibName: "MainListVc", bundle: nil)
            vc.title = self.arrControls[indexPath.row]["Title"] as? String
            vc.arrControls = self.arrControls[indexPath.row]["data"] as! [[String : Any]]
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            let uc = NSClassFromString("UIControls." + screenName) as! UIViewController.Type
            let vc = uc.init(nibName: screenName, bundle: nil)
            vc.title = self.arrControls[indexPath.row]["Title"] as? String
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
