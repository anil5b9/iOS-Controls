//
//  NVActivityIndicatorVc.swift
//  ThirdPartyControls
//
//  Created by Satya on 29/08/18.
//  Copyright © 2018 Hiddenbrains. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class NVActivityIndicatorVc: UIViewController,NVActivityIndicatorViewable {
    
    @IBOutlet weak var activityIndicatorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "NVActivityIndicatorView"
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewInitialization()
    }
    func viewInitialization() {
        self.activityIndicatorView.backgroundColor = UIColor.orange
        let cols = 4
        let rows = 8
        let cellWidth = Int(self.activityIndicatorView.frame.width / CGFloat(cols))
        let cellHeight = Int(self.activityIndicatorView.frame.height / CGFloat(rows))
        (NVActivityIndicatorType.ballPulse.rawValue ... NVActivityIndicatorType.circleStrokeSpin.rawValue).forEach {
            let x = ($0 - 1) % cols * cellWidth
            let y = ($0 - 1) / cols * cellHeight
            let frame = CGRect(x: x, y: y, width: cellWidth, height: cellHeight)
            let activityIndicatorView = NVActivityIndicatorView(frame: frame,
                                                                type: NVActivityIndicatorType(rawValue: $0)!)
            let animationTypeLabel = UILabel(frame: frame)
            
            animationTypeLabel.text = String($0)
            animationTypeLabel.sizeToFit()
            animationTypeLabel.textColor = UIColor.white
            animationTypeLabel.frame.origin.x += 5
            animationTypeLabel.frame.origin.y += CGFloat(cellHeight) - animationTypeLabel.frame.size.height
            
            activityIndicatorView.padding = 20
            if $0 == NVActivityIndicatorType.orbit.rawValue {
                activityIndicatorView.padding = 0
            }
            self.activityIndicatorView.addSubview(activityIndicatorView)
            self.activityIndicatorView.addSubview(animationTypeLabel)
            activityIndicatorView.startAnimating()
            
            let button: UIButton = UIButton(frame: frame)
            button.tag = $0
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            self.activityIndicatorView.addSubview(button)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        let size = CGSize(width: 30, height: 30)
        
        startAnimating(size, message: "Loading...", type: NVActivityIndicatorType(rawValue: sender.tag)!, fadeInAnimation: nil)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
            NVActivityIndicatorPresenter.sharedInstance.setMessage("Authenticating...")
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            self.stopAnimating(nil)
        }
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
