//
//  JHNavBarHandle.swift
//
//  Created by JiaHao on 6/23/15.
//  Copyright (c) 2015 JH. All rights reserved.
//

import UIKit
class JHNavBarHandle: NSObject {
    
    class func handleJHNavigationBarAlpha(scroll:UIScrollView,uiviewcontoller:UIViewController){
        uiviewcontoller.automaticallyAdjustsScrollViewInsets = false
        var overlayColor = uiviewcontoller.navigationController?.navigationBar.overlayColor
        var offsetY = scroll.contentOffset.y
        if offsetY > 50{
            let alpha = 1 - ((50+64-offsetY)/64)
            uiviewcontoller.navigationController?.navigationBar.jh_setBackgroundColor(overlayColor!.colorWithAlphaComponent(alpha))
        }else{
         uiviewcontoller.navigationController?.navigationBar.jh_setBackgroundColor(overlayColor!.colorWithAlphaComponent(0))
        }
    }
    
    class func handleJHNavigationBarHeight(scroll:UIScrollView,uiviewcontoller:UIViewController){
        uiviewcontoller.automaticallyAdjustsScrollViewInsets = false
        var offsetY = scroll.contentOffset.y
        if offsetY > 0{
            if(offsetY >= 44){
                self.setNavigationBarTransformProgress(uiviewcontoller,progress: 1)
            }else{
                self.setNavigationBarTransformProgress(uiviewcontoller,progress: offsetY / 44)
            }
        }else{
            self.setNavigationBarTransformProgress(uiviewcontoller,progress: 0)
            uiviewcontoller.navigationController?.navigationBar.backIndicatorImage = nil
            uiviewcontoller.navigationController?.navigationBar.backIndicatorTransitionMaskImage = nil

        }
    }
    
    class func setNavigationBarTransformProgress(uiviewcontoller:UIViewController,progress:CGFloat){
        uiviewcontoller.navigationController?.navigationBar.jh_setTranslationY(-44 * progress)
        uiviewcontoller.navigationController?.navigationBar.jh_setContentAlpha(1-progress)
    }
}
