//
//  ExampleCircularSliderVc.swift
//  UIControls
//
//  Created by Satya on 12/09/18.
//  Copyright © 2018 Hiddenbrains. All rights reserved.
//

import UIKit
import HGCircularSlider

extension CALayer {
    
    func borderUIColor() -> UIColor? {
        return borderColor != nil ? UIColor(cgColor: borderColor!) : nil
    }
    
    func setBorderUIColor(_ color: UIColor) {
        borderColor = color.cgColor
    }
}

class ExampleCircularSliderVc: UIViewController {
    
    @IBOutlet weak var circularSlider: MidPointCircularSlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        circularSlider.minimumValue = 0.0
        circularSlider.maximumValue = 10.0
        circularSlider.distance = 1.0
        circularSlider.midPointValue = 5.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
