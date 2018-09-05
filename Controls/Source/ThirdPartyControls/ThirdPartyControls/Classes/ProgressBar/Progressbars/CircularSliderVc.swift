//
//  CircularSliderVc.swift
//  ThirdPartyControls
//
//  Created by Satya on 29/08/18.
//  Copyright © 2018 Hiddenbrains. All rights reserved.
//

import UIKit
import HGCircularSlider


class CircularSliderVc: UIViewController {
    @IBOutlet weak var circularSlider: CircularSlider!
    @IBOutlet weak var lblSliderValue: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        circularSlider.minimumValue = 0
        circularSlider.maximumValue = 10
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
    @IBAction func valueChanged(_ sender: CircularSlider) {
        self.lblSliderValue.text = "\(Int(sender.endPointValue))"
    }

}
