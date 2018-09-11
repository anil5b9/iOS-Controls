//
//  PullToMakeSoupVc.swift
//  ThirdPartyControls
//
//  Created by Satya on 04/09/18.
//  Copyright © 2018 Hiddenbrains. All rights reserved.
//

import UIKit
import PullToMakeSoup

class PullToMakeSoupVc: UIViewController {
    @IBOutlet weak var tblView: UITableView!
    var arrData = [[String : String]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeData()
        tblView.reloadData()
        // Do any additional setup after loading the view.
        
        let rightButtonItem = UIBarButtonItem.init(
            title: "Refresh",
            style: .done,
            target: self,
            action: #selector(refresh)
        )
        self.navigationItem.rightBarButtonItem = rightButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tblView.addPullToRefresh(PullToMakeSoup(at: .top))  {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                self.tblView.endRefreshing(at: .top)
            }
        }
    }
    func initializeData() {
        do {
            if let file = Bundle.main.url(forResource: "countries", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [[String: String]] {
                    self.arrData = object
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction fileprivate func refresh() {
        tblView.startRefreshing(at: .top)
    }

}
extension PullToMakeSoupVc: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        if( !(cell != nil))
        {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        }
        cell?.textLabel?.text = self.arrData[indexPath.row]["name"]
        return cell!
        
    }
    
}
