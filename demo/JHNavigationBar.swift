//
//  JHNavigationBar.swift
//
//  Created by JiaHao on 6/23/15.
//  Copyright (c) 2015 JH. All rights reserved.
//

import Foundation
import UIKit



extension UINavigationBar {
    
    private struct AssociatedKeys {
        static var overLay = "overLay"
        static var emptyImage = "emptyImage"
        static var overlayColor = "overlayColor"
    }
    
    var overlay: UIView? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.overLay) as?UIView
        }
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(
                    self,
                    &AssociatedKeys.overLay,
                    newValue as UIView?,
                    UInt(OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                )
            }
        }
    }
    var overlayColor:UIColor?{
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.overlayColor) as?UIColor
        }
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(
                    self,
                    &AssociatedKeys.overlayColor,
                    newValue as UIColor?,
                    UInt(OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                )
            }
        }
    }
    var emptyImage: UIImage? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.emptyImage) as?UIImage
        }
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(
                    self,
                    &AssociatedKeys.emptyImage,
                    newValue as UIImage?,
                    UInt(OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                )
            }
        }
    }
    
    func jh_setBackgroundColor(color:UIColor){
        self.shadowImage = UIImage.new()
        if let jh_Overlay = overlay{
        }else{
            self.setBackgroundImage(UIImage.new(), forBarMetrics: UIBarMetrics.Default)
            overlay = UIView(frame:CGRectMake(0, -20, UIScreen.mainScreen().bounds.size.width, CGRectGetHeight(self.bounds)+20))
            overlay?.userInteractionEnabled = false
            self.insertSubview(overlay!, atIndex: 0)
        }
        overlay!.backgroundColor = color
    }
    
    func jh_setTranslationY(translationY:CGFloat){
        self.transform = CGAffineTransformMakeTranslation(0, translationY)
    }
    
    func jh_setContentAlpha(alpha:CGFloat){
        if let jh_Overlay = overlay{
            self.jh_setAlphaForSubviewsOfView(alpha, view: self)
            if alpha == 1 {
                if let emptyImage = self.emptyImage{
                }else{
                    self.emptyImage = UIImage.new()
                }
                self.backIndicatorImage = self.emptyImage
                self.backIndicatorTransitionMaskImage = self.emptyImage
            }
        }else{
            if let barTint = self.barTintColor{
                self.jh_setBackgroundColor(self.barTintColor!)
            }
        }
    }
    
    func jh_setAlphaForSubviewsOfView(alpha:CGFloat,view:UIView){
        for subview in view.subviews as! [UIView]{
            if subview .isEqual(self.overlay) {
                continue
            }
            subview.alpha = alpha
            self.jh_setAlphaForSubviewsOfView(alpha, view: subview)
        }
    }
    
    func jh_alphaReset(){
        self.shadowImage = nil
        overlay!.backgroundColor = self.overlayColor
        self.overlay = nil
    }
    func jh_heightReset(){
        self.jh_setTranslationY(0)
    }
    
}


