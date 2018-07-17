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
    private var myImageWidth:CGFloat        = 32
    private var myImageHeight:CGFloat       = 32
    private var myImageLeftAnchor:CGFloat   = 15
    private var myImageTopAcnchor:CGFloat   = 20
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
        
        myImage.translatesAutoresizingMaskIntoConstraints           = false
        mySubTitle.translatesAutoresizingMaskIntoConstraints        = false
        myBigTitle.translatesAutoresizingMaskIntoConstraints        = false
        
        myView.addSubview(myBigTitle)
        myView.addSubview(mySubTitle)
        myView.addSubview(myImage)
        // For Big Title
        myBigTitle.text                     = bigTitle
        myBigTitle.textColor                = textColor
        myBigTitle.textAlignment            = .left
        myBigTitle.font                     = UIFont(name: fontName, size: titleFontSize)
        
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
    
    public func show(title:String,subtitle:String,mImage:UIImage){
        myImage.image       = mImage
        
        createView(bigTitle: title,subTitle:subtitle)
        createImageView(width: myImageWidth, height: myImageHeight, top: myImageTopAcnchor, left: myImageLeftAnchor,isActive: true)
    }

    public func show(title:String,subtitle:String,mImage:UIImage,delay:Int){
        myImage.image       = mImage
        
        createView(bigTitle: title,subTitle:subtitle)
        createImageView(width: myImageWidth, height: myImageHeight, top: myImageTopAcnchor, left: myImageLeftAnchor,isActive: true)
        closeToDelay(delayTime: delay)
    }
    
    public func close(){
        UIView.animate(withDuration: 0.4, delay:0, options: [],animations: {
            self.myView.center.y = CGFloat(-(self.viewHeight*2))
        },
                completion: nil
        )
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            if let viewWithTag = self.myView.viewWithTag(100) {
                viewWithTag.removeFromSuperview()
            }
        }

    }
    
    
    private func createImageView(width:CGFloat,height:CGFloat,top:CGFloat,left:CGFloat,isActive:Bool){
        myImage.widthAnchor.constraint(equalToConstant: width).isActive                            = isActive
        myImage.heightAnchor.constraint(equalToConstant: height).isActive                          = isActive
        myImage.topAnchor.constraint(equalTo: myView.topAnchor , constant:top).isActive            = isActive
        myImage.leftAnchor.constraint(equalTo: myView.leftAnchor , constant:left).isActive         = isActive
        myImage.layoutIfNeeded()
        myImage.updateConstraintsIfNeeded()
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
        let swipeUp       = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
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
