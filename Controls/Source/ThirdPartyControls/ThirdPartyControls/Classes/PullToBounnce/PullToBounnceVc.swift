//
//  PullToBounnceVc.swift
//  ThirdPartyControls
//
//  Created by Satya on 05/09/18.
//  Copyright © 2018 Hiddenbrains. All rights reserved.
//

import UIKit

class PullToBounnceVc: UIViewController {
    var tblView: UITableView?
    let bodyView = UIView()
    var wrapper: PullToBounceWrapper?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if tblView == nil {
            self.view.backgroundColor = UIColor.customBlue
            
            bodyView.frame = self.view.frame
            bodyView.frame.y += 20 + 44
            let tableView = UITableView(frame: self.view.frame, style: UITableViewStyle.plain)
            tblView = tableView
            tableView.delegate = self
            tableView.dataSource = self
            self.view.addSubview(bodyView)
            let tableViewWrapper = PullToBounceWrapper(scrollView: tableView)
            wrapper = tableViewWrapper
            bodyView.addSubview(tableViewWrapper)
            tableViewWrapper.didPullToRefresh = {
                _ = Timer.schedule(delay: 2) { timer in
                    tableViewWrapper.stopLoadingAnimation()
                }
            }
            
            makeMock()
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
   
    
    func makeMock() {
        let headerView = UIView()
        headerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 64)
        headerView.backgroundColor = UIColor.lightBlue
        self.view.addSubview(headerView)
        
        let headerLine = UIView()
        headerLine.frame = CGRect(x: 0, y: 0, width: 120, height: 8)
        headerLine.layer.cornerRadius = headerLine.frame.height/2
        headerLine.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        headerLine.center = CGPoint(x: headerView.frame.center.x, y: 20 + 44/2)
        headerView.addSubview(headerLine)
    }
}
extension PullToBounnceVc: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        if( !(cell != nil))
        {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        }
        cell?.textLabel?.text = "Row ---> \(indexPath.row)"
        return cell!
        
    }
    
}

