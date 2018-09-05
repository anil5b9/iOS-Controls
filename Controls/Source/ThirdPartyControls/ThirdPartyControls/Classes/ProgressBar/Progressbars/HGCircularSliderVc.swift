//
//  HGCircularSliderVc.swift
//  ThirdPartyControls
//
//  Created by Satya on 29/08/18.
//  Copyright © 2018 Hiddenbrains. All rights reserved.
//

import UIKit

class HGCircularSliderVc: UIViewController {
    @IBOutlet weak var tblControls: UITableView!
    var arrControls = [[String : String]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeData()
        self.tblControls.reloadData()
        self.tblControls.tableFooterView = UIView()
        self.title = "HGCircularSlider"

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

extension HGCircularSliderVc: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrControls.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        if( !(cell != nil))
        {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        }
        cell?.textLabel?.text = self.arrControls[indexPath.row]["Title"]
        cell?.accessoryType = .disclosureIndicator
        return cell!
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let screenName = self.arrControls[indexPath.row]["ScreenName"]
        let vc = NSClassFromString("ThirdPartyControls." + screenName!) as! UIViewController.Type
        self.navigationController?.pushViewController(vc.init(nibName: screenName, bundle: nil), animated: true)
    }
    
    func initializeData() {
        do {
            if let file = Bundle.main.url(forResource: "HGCircularSlider", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [[String: String]] {
                    self.arrControls = object
                } else {
                    print("JSON is invalid")
                }
            } else {
                print("no file")
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
