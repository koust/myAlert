//
//  ViewController.swift
//  myAlert
//
//  Created by Batuhan Saygili on 15.07.2018.
//  Copyright © 2018 Batuhan Saygili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let myAlert = MyAlertController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myAlert.yourView = self.view
        myAlert.bgColor = UIColor.orange
        myAlert.textColor = UIColor.white
        myAlert.fontName = "Helvetica"
        myAlert.subTitleFontSize = 14
        myAlert.show(title:"For example alert view and title",subtitle:"Here is the sub title",mImage:UIImage(named:"info")!,delay:3)
    }

    @IBAction func pressToClose(_ sender: Any) {
        myAlert.close()
    }
    
    @IBAction func pressToShow(_ sender: Any) {
        myAlert.show(title:"For example alert view and title",subtitle:"Here is the sub title")
    }
}

