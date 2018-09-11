//
//  EmptyDataSetVc.swift
//  ThirdPartyControls
//
//  Created by Satya on 06/09/18.
//  Copyright © 2018 Hiddenbrains. All rights reserved.
//

import UIKit
import EmptyDataSet_Swift

class EmptyDataSetVc: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    enum Implementation {
        case original
        case new
    }
    
     let appsData: [[String: String]] = {
        // get all applications from applications.json
        let path = Bundle.main.path(forResource: "applications", ofType: "json")
        do {
            let data = try Data.init(contentsOf: URL.init(fileURLWithPath: path!))
            do {
                if let result = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [[String: String]] {
                    return result
                }
            } catch { }
        } catch { }
        return []
    }()
    
    var impl: Implementation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        title = "Applications"
        navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "", style: .plain, target: nil, action: nil)
        
        tableView.tableFooterView = UIView()
        
        navigationController?.navigationBar.titleTextAttributes = nil
        navigationController?.navigationBar.barTintColor = UIColor(red: 248.0 / 255.0, green: 248.0 / 255.0, blue: 248.0 / 255.0, alpha: 1)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barStyle = .default
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = UIColor(red: 248.0 / 255.0, green: 248.0 / 255.0, blue: 248.0 / 255.0, alpha: 1)
        navigationController?.navigationBar.tintColor = UIColor.black
        UIApplication.shared.statusBarStyle = .default
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appsData.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "cell")
        }
        let app = appsData[indexPath.row]
        cell.textLabel?.text = app["display_name"]
        cell.detailTextLabel?.text = app["developer_name"]
        
        let image = UIImage.init(named: ("icon_" + app["display_name"]!).lowercased().replacingOccurrences(of: " ", with: "_"))
        cell.imageView?.image = image
        
        cell.imageView?.layer.cornerRadius = (image?.size.width)! * 0.2
        cell.imageView?.layer.masksToBounds = true
        cell.imageView?.layer.borderColor = UIColor(white: 0, alpha: 0.2).cgColor
        cell.imageView?.layer.borderWidth = 0.5
        
        cell.imageView?.layer.shouldRasterize = true
        cell.imageView?.layer.rasterizationScale = UIScreen.main.scale
        
        return cell!
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == appsData.count - 1 {
            navigationController?.pushViewController(TestViewController(), animated: true)
        } else {
            let app = appsData[indexPath.row]
            var controller: UIViewController
            if let screenName = app["display_name"] {
                controller = OriginalUsageViewController(screenName)
                navigationController?.pushViewController(controller, animated: true)
            }
        }
       
    }
    
}
