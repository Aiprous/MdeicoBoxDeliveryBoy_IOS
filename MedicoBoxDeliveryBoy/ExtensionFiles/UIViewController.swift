//
//  UIViewControllerExtension.swift
//  SlideMenuControllerSwift
//
//  Created by Yuji Hato on 1/19/15.
//  Copyright (c) 2015 Yuji Hato. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func setNavigationBarItem() {
        
        self.addLeftBarButtonWithImage(UIImage(named: "ic_menu_black_24dp")!)
        self.addRightBarButtonWithImage(UIImage(named: "ic_notifications_black_24dp")!)
        self.addTitleImageView()
        self.slideMenuController()?.removeLeftGestures()
        self.slideMenuController()?.removeRightGestures()
        self.slideMenuController()?.addLeftGestures()
        self.slideMenuController()?.addRightGestures()
    }
    func setNavigationBarItemBackButton() {
        
        self.addLeftBarBackButton(UIImage(named: "back-arrow")!)
    }
    
     func setNavigationBackButtonOnly() {
        
        self.addLeftBarButtonWithBackImage(UIImage(named: "ic_menu_black_24dp")!)
        self.slideMenuController()?.removeLeftGestures()
        self.slideMenuController()?.removeRightGestures()
        self.slideMenuController()?.addLeftGestures()
        self.slideMenuController()?.addRightGestures()
    }
    public func addLeftBarButtonWithBackImage(_ buttonImage: UIImage) {
        
        // button
        let leftButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        leftButton.setBackgroundImage(buttonImage, for: .normal)
        leftButton.addTarget(self, action: #selector(self.toggleLeft), for: .touchUpInside)
        let leftBarButtomItem = UIBarButtonItem(customView: leftButton)
        
        //Label
        let tittleText = UILabel ()
        tittleText.frame = CGRect.init(x: 0, y: 0, width: 30, height: 30)
        tittleText.text = self.title;
        let leftIconBarLabelItem:UIBarButtonItem = UIBarButtonItem(customView: tittleText)
        navigationItem.leftBarButtonItems = [leftBarButtomItem]
        
    }
    
    public func addLeftBarButtonWithBackImagePharm(_ buttonImage: UIImage) {
        
        // button
        let leftButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        leftButton.setBackgroundImage(buttonImage, for: .normal)
        leftButton.addTarget(self, action: #selector(self.toggleLeft), for: .touchUpInside)
        let leftBarButtomItem = UIBarButtonItem(customView: leftButton)
        
        //Label
        let tittleText = UILabel ()
        tittleText.frame = CGRect.init(x: 0, y: 0, width: 30, height: 30)
        tittleText.text = self.title;
        let leftIconBarLabelItem:UIBarButtonItem = UIBarButtonItem(customView: tittleText)
        navigationItem.leftBarButtonItems = [leftBarButtomItem]
        
    }
    
    public func addLeftBarBackButton(_ buttonImage: UIImage) {
        
        // button
        let leftButton = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        leftButton.setBackgroundImage(buttonImage, for: .normal)
        leftButton.addTarget(self, action: #selector(self.backView), for: .touchUpInside)
        let leftBarButtomItem = UIBarButtonItem(customView: leftButton)
        
        //Label
        let tittleText = UILabel ()
        tittleText.frame = CGRect.init(x: 0, y: 0, width: 30, height: 30)
        tittleText.text = self.title;
        let leftIconBarLabelItem:UIBarButtonItem = UIBarButtonItem(customView: tittleText)
        navigationItem.leftBarButtonItems = [leftBarButtomItem]
        
    }
    
    @objc public func backView(){
        self.navigationController?.popViewController(animated: true)
    }
    
    func removeNavigationBarItem() {
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.rightBarButtonItem = nil
        self.slideMenuController()?.removeLeftGestures()
        self.slideMenuController()?.removeRightGestures()
    }
}
