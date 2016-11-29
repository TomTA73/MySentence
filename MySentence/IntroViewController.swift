//
//  IntroViewController.swift
//  MySentence
//
//  Created by Tom geri on 23/11/2016.
//  Copyright © 2016 Tom geri. All rights reserved.
//

import UIKit

extension UIImageView {
    func addBlurEffect() {
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(blurEffectView)
    }
}


class IntroViewController: UIViewController {

    
    @IBOutlet weak var Background: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Background.addBlurEffect()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
