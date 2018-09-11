//
//  TabScreenOne.swift
//  ThirdPartyControls
//
//  Created by Satya on 05/09/18.
//  Copyright © 2018 Hiddenbrains. All rights reserved.
//

import UIKit
import RAMAnimatedTabBarController

class TabScreenOne: UIViewController {
    @IBOutlet weak var lblText: UILabel!
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
        if let strText = (self.tabBarItem as? RAMAnimatedTabBarItem)?.animation.classForCoder.description(), strText.components(separatedBy: ".").count > 0 {
            self.lblText.text = strText.components(separatedBy: ".")[1]
        }
         (self.tabBarItem as? RAMAnimatedTabBarItem)?.playAnimation()
        
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
