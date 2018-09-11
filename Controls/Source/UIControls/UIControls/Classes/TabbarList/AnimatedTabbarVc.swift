//
//  AnimatedTabbarVc.swift
//  ThirdPartyControls
//
//  Created by Satya on 29/08/18.
//  Copyright © 2018 Hiddenbrains. All rights reserved.
//

import UIKit
import RAMAnimatedTabBarController

class AnimatedTabbarVc: RAMAnimatedTabBarController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initializeTabbar()
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
        let item1 = RAMAnimatedTabBarItem(title: "tab1", image: UIImage(named: "Settings"), selectedImage: UIImage(named: "Settings"))
        let animation1 = RAMLeftRotationAnimation()
        animation1.duration = 0.8
        item1.animation = animation1
        
        let item2 = RAMAnimatedTabBarItem(title: "tab2", image: UIImage(named: "Tools_00028"), selectedImage: UIImage(named: "Tools_00028"))
        let animation2 = RAMFrameItemAnimation()
        animation2.imagesPath = "ToolsAnimation"
        animation2.isDeselectAnimation = true
        item2.animation = animation2
        
        let item3 = RAMAnimatedTabBarItem(title: "tab3", image: UIImage(named: "icon_user"), selectedImage: UIImage(named: "icon_user"))
        let animation3 = RAMLeftRotationAnimation()
        animation3.duration = 0.3
        item3.animation = animation3
        
        
        let item4 = RAMAnimatedTabBarItem(title: "tab4", image: UIImage(named: "icon_pin"), selectedImage: UIImage(named: "icon_pin"))
        let animation4 = RAMFlipLeftTransitionItemAnimations()
        animation4.duration = 0.4
        item4.animation = animation4
        
        let item5 = RAMAnimatedTabBarItem(title: "tab5", image: UIImage(named: "drop"), selectedImage: UIImage(named: "drop"))
        let animation5 = RAMFumeAnimation()
        animation5.duration = 0.4
        item5.animation = animation5
        
        let vc1 = TabScreenOne(nibName: "TabScreenOne", bundle: nil)
        vc1.tabBarItem = item1
        let itemAnimation2 = RAMBounceAnimation()
        item2.animation = itemAnimation2
        
        let vc2 = TabScreenOne(nibName: "TabScreenOne", bundle: nil)
        vc2.tabBarItem = item2
        
        let vc3 = TabScreenOne(nibName: "TabScreenOne", bundle: nil)
        vc3.tabBarItem = item3
        self.setViewControllers([vc1,vc2,vc3], animated: false)
        
        let vc4 = TabScreenOne(nibName: "TabScreenOne", bundle: nil)
        vc4.tabBarItem = item4
        
        let vc5 = TabScreenOne(nibName: "TabScreenOne", bundle: nil)
        vc5.tabBarItem = item5
        self.setViewControllers([vc1,vc2,vc3,vc4,vc5], animated: false)
    }

}




