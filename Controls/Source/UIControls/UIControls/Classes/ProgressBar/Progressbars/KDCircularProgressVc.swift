//
//  KDCircularProgressVc.swift
//  ThirdPartyControls
//
//  Created by Satya on 29/08/18.
//  Copyright © 2018 Hiddenbrains. All rights reserved.
//

import UIKit
import KDCircularProgress
class KDCircularProgressVc: UIViewController {
    @IBOutlet weak var progress: KDCircularProgress!
    override func viewDidLoad() {
        super.viewDidLoad()
         view.backgroundColor = UIColor(white: 0.22, alpha: 1)
        animateProgressBar()
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
    
    func animateProgressBar() {
        progress.animate(fromAngle: 0, toAngle: 360, duration: 1) { completed in
            if completed {
                print("animation stopped, completed")
//                self.animateProgressBar()
            } else {
                print("animation stopped, was interrupted")
//                self.animateProgressBar()
            }
        }
    }
    @IBAction func btnAnimate(_ sender: UIButton) {
        progress.animate(fromAngle: 0, toAngle: 360, duration: 1) { completed in
            if completed {
                print("animation stopped, completed")
            } else {
                print("animation stopped, was interrupted")
            }
        }
    }
    
    @IBAction func sliderAngleChanged(_ sender: UISlider) {
        progress.angle = Double(sender.value)
    }

}
