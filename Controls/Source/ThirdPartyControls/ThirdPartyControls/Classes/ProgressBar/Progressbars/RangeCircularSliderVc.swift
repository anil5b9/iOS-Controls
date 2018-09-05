//
//  RangeCircularSliderVc.swift
//  ThirdPartyControls
//
//  Created by Satya on 29/08/18.
//  Copyright © 2018 Hiddenbrains. All rights reserved.
//

import UIKit
import HGCircularSlider

class RangeCircularSliderVc: UIViewController {
    @IBOutlet weak var rangeCircularSlider: RangeCircularSlider!
    @IBOutlet weak var lblMinValue: UILabel!
    @IBOutlet weak var lblMaxValue: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        rangeCircularSlider.startThumbImage = UIImage(named: "Bedtime")
        rangeCircularSlider.endThumbImage = UIImage(named: "Wake")
        self.title = "RangeCircularSlider"

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
    
    @IBAction func updatelbls(_ sender: RangeCircularSlider) {
        self.lblMinValue.text = "\(Int(sender.startPointValue))"
        self.lblMaxValue.text = "\(Int(sender.endPointValue))"
    }

}
