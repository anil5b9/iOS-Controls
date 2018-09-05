//
//  MinimalTabVc.swift
//  ThirdPartyControls
//
//  Created by Satya on 29/08/18.
//  Copyright © 2018 Hiddenbrains. All rights reserved.
//

import UIKit
import MinimalTabBar

class MinimalTabVc: JDMinimalTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeTabbar()
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
    
    func initializeTabbar() {
        let vc1 = CircularSliderVc(nibName: "CircularSliderVc", bundle: nil)
        vc1.tabBarItem = UITabBarItem(title: "Tab1", image: UIImage(named: "icon_1"), selectedImage: UIImage(named: "icon_menu"))
        let vc2 = KDCircularProgressVc(nibName: "KDCircularProgressVc", bundle: nil)
        vc2.tabBarItem = UITabBarItem(title: "Tab2", image: UIImage(named: "icon_2"), selectedImage: UIImage(named: "icon_menu"))
        let vc3 = MidPointCircularSliderVc(nibName: "MidPointCircularSliderVc", bundle: nil)
        vc3.tabBarItem = UITabBarItem(title: "Tab3", image: UIImage(named: "icon_3"), selectedImage: UIImage(named: "icon_menu"))
        self.viewControllers = [vc1,vc2,vc3]
        self.minimalBar.defaultTintColor = #colorLiteral(red: 0.8778396249, green: 0.6896829009, blue: 0.9313786626, alpha: 1)
        self.minimalBar.selectedTintColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
    }

}
