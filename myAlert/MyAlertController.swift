//
//  MyAlertController.swift
//  myAlert
//
//  BATUHAN SAYGILI
//  Github.com/koust
//
//  Copyright © 2018 Batuhan Saygili. All rights reserved.
//

import UIKit

public class MyAlertController: UIViewController {

    
    public var bgColor                      = UIColor.white
    public var textColor                    = UIColor.black
    public var fontName:String              = "Avenir-Light"
    public var titleFontSize: CGFloat       = 16
    public var subTitleFontSize: CGFloat    = 13
    public var alertRadius:CGFloat          = 10
    public var yourView: UIView?
    
    private var viewHeight:Int              = 80
    private var myImageWidth:CGFloat        = 0
    private var myImageHeight:CGFloat       = 0
    private var myImageLeftAnchor:CGFloat   = 0
    private var myImage                     = UIImageView()
    private let myView                      = UIView()
    private let myBigTitle                  = UILabel()
    private let mySubTitle                  = UILabel()
    
    private func createView(bigTitle:String,subTitle:String){
        // For View
        myView.frame                        = CGRect(x: 10, y: -81,width: Int(UIScreen.main.bounds.width-20), height: self.viewHeight)
        myView.backgroundColor              = bgColor
        myView.layer.cornerRadius           = alertRadius
        myView.clipsToBounds                = true
        myView.tag                          = 100
        
        
        mySubTitle.translatesAutoresizingMaskIntoConstraints        = false
        myBigTitle.translatesAutoresizingMaskIntoConstraints        = false
        myImage.translatesAutoresizingMaskIntoConstraints           = false
        
        myView.addSubview(myBigTitle)
        myView.addSubview(mySubTitle)
        myView.addSubview(myImage)
        
        // For Big Title
        myBigTitle.text                 = bigTitle
        myBigTitle.textColor            = textColor
        myBigTitle.textAlignment        = .left
        myBigTitle.font                 = UIFont(name: fontName, size: titleFontSize)
        
        myBigTitle.topAnchor.constraint(equalTo: myView.topAnchor , constant:15).isActive                  = true
        myBigTitle.leftAnchor.constraint(equalTo: myImage.rightAnchor , constant:15).isActive              = true
        myBigTitle.rightAnchor.constraint(equalTo: myView.rightAnchor , constant:10).isActive              = true
        
        // For Sub Title
        
        mySubTitle.text                 = subTitle
        mySubTitle.textColor            = textColor
        mySubTitle.textAlignment        = .left
        mySubTitle.font                 = UIFont(name: fontName, size: subTitleFontSize)
        
        mySubTitle.topAnchor.constraint(equalTo: myBigTitle.bottomAnchor , constant:10).isActive          = true
        mySubTitle.leftAnchor.constraint(equalTo: myImage.rightAnchor , constant:15).isActive             = true
        mySubTitle.rightAnchor.constraint(equalTo: myView.rightAnchor , constant:10).isActive             = true
        
        // For Image
   
        myImage.widthAnchor.constraint(equalToConstant: myImageWidth).isActive                            = true
        myImage.heightAnchor.constraint(equalToConstant: myImageHeight).isActive                          = true
        myImage.topAnchor.constraint(equalTo: myView.topAnchor , constant:20).isActive                    = true
        myImage.leftAnchor.constraint(equalTo: myView.leftAnchor , constant:myImageLeftAnchor).isActive   = true
        
        
        self.yourView?.addSubview(myView)
        
        viewShowAnimation()
        swipeToClose()
    }

    
    public func show(title:String,subtitle:String){
        createView(bigTitle: title,subTitle: subtitle)
    }
    
    
    
    public func show(title:String,subtitle:String,delay:Int){
        createView(bigTitle: title,subTitle:subtitle)
        closeToDelay(delayTime: delay)
    }

    public func show(title:String,subtitle:String,mImage:UIImage,delay:Int){
        myImageWidth        = 32
        myImageHeight       = 32
        myImageLeftAnchor   = 15
        myImage.image       = mImage
        
        
        createView(bigTitle: title,subTitle:subtitle)
        closeToDelay(delayTime: delay)
    }
    
    public func close(){
        UIView.animate(withDuration: 0.4, delay:0, options: [],animations: {
            self.myView.center.y = CGFloat(-(self.viewHeight*2))
            
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    if let viewWithTag = self.yourView?.viewWithTag(100) {
                        viewWithTag.removeFromSuperview()
                    }
                }
            
        },
                completion: nil
        )

    }
    
    private func closeToDelay(delayTime:Int){
        // Animation
        viewCloseAnimation(delayTime: delayTime)
        // Remove View
        DispatchQueue.main.asyncAfter(deadline:.now() + TimeInterval(delayTime)) {
            if(self.myView.center.y == CGFloat(-(self.viewHeight*2))){
                self.close()
            }
        }
    }
    
    private func swipeToClose(){
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeUp.direction = .up
        self.myView.addGestureRecognizer(swipeUp)
    }
    
    // For close animation
    private func viewCloseAnimation(delayTime:Int){
        UIView.animate(withDuration: 0.8, delay: TimeInterval(delayTime)-1, options: [],animations: {
            self.myView.center.y = CGFloat(-(self.viewHeight*2))
        },
            completion: nil
        )
    }
    
    
    // For show animation
    private func viewShowAnimation(){
        UIView.animate(withDuration: 0.3, delay:0, options: [],animations: {
            self.myView.center.y = CGFloat(80)
        },
            completion: nil
        )
    }
    
    @objc  private func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        if gesture.direction == UISwipeGestureRecognizerDirection.up {
            close()
        }
    }
}
