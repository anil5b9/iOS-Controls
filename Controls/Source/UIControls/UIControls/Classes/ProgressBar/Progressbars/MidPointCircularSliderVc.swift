//
//  MidPointCircularSliderVc.swift
//  ThirdPartyControls
//
//  Created by Satya on 29/08/18.
//  Copyright © 2018 Hiddenbrains. All rights reserved.
//

import UIKit
import HGCircularSlider

class MidPointCircularSliderVc: UIViewController {
    @IBOutlet weak var midPointSlider: MidPointCircularSlider!
    @IBOutlet weak var lblValue: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        midPointSlider.minimumValue = 0.0
        midPointSlider.maximumValue = 10.0
        midPointSlider.distance = 1.0
        midPointSlider.midPointValue = 10.0

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
    @IBAction func updateValue(_ sender: Any) {
        self.lblValue.text = "\(Int(midPointSlider.endPointValue))"
    }

}
