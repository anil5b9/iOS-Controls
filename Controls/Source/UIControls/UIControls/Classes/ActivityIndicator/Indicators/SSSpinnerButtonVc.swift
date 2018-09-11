//
//  SSSpinnerButtonVc.swift
//  ThirdPartyControls
//
//  Created by Satya on 29/08/18.
//  Copyright © 2018 Hiddenbrains. All rights reserved.
//

import UIKit
import SSSpinnerButton

class SSSpinnerButtonVc: UIViewController {
    @IBOutlet weak var btnClipRotate: SSSpinnerButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "SSSpinnerButton"
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
    @IBAction func btnAnimateClicked(_ sender: SSSpinnerButton) {
        let arr : [SpinnerType] = [.ballClipRotate,.ballSpinFade,.lineSpinFade,.circleStrokeSpin,.ballRotateChase]
        sender.startAnimate(spinnerType: arr[sender.tag], spinnercolor: .white, spinnerSize: 25, complete: nil)
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 2) {
            sender.stopAnimate(complete: {
                
            })
        }
    }
}
