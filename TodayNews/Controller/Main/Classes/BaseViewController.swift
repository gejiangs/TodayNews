//
//  BaseViewController.swift
//  BookReader
//
//  Created by gejiangs on 16/6/14.
//  Copyright © 2016年 gejiangs. All rights reserved.
//

import UIKit
//fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
//  switch (lhs, rhs) {
//  case let (l?, r?):
//    return l < r
//  case (nil, _?):
//    return true
//  default:
//    return false
//  }
//}
//
//fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
//  switch (lhs, rhs) {
//  case let (l?, r?):
//    return l > r
//  default:
//    return rhs < lhs
//  }
//}


class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        self.view.backgroundColor =  RGB(240, 239, 245)
        if(self.navigationController?.viewControllers.count > 1){
            self.resetBackBarButton();
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func resetBackBarButton()
    {
        self.addLeftBarImageName("nav_back", target: self, action: #selector(BaseViewController.viewWillBack));
    }
    
    func viewWillBack()
    {
        self.navigationController?.popViewController(animated: true);
    }
    
    func pushViewControllerName(_ vcName:String!)
    {
        
    }
    
    
    func addLeftBarTitle(_ title:String?, target:AnyObject?, action:Selector)
    {
        let barButtonItem = UIBarButtonItem(title: title, style: UIBarButtonItemStyle.plain, target: target, action: action)
        self.navigationItem.leftBarButtonItem = barButtonItem
    }
    
    func addRightBarTitle(_ title:String?, target:AnyObject?, action:Selector)
    {
        let barButtonItem = UIBarButtonItem(title: title, style: UIBarButtonItemStyle.plain, target: target, action: action)
        self.navigationItem.rightBarButtonItem = barButtonItem
    }
    
    func addLeftBarImageName(_ name:String?,target:AnyObject?, action:Selector)
    {
        let image = UIImage(named: name!)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal);
        let barButtonItem = UIBarButtonItem(image: image, landscapeImagePhone: nil, style: UIBarButtonItemStyle.plain, target: target, action: action)
        self.navigationItem.leftBarButtonItem = barButtonItem
    }
    
    func addRightBarImageName(_ name:String?,target:AnyObject?, action:Selector)
    {
        let image = UIImage(named: name!)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal);
        let barButtonItem = UIBarButtonItem(image: image, landscapeImagePhone: nil, style: UIBarButtonItemStyle.plain, target: target, action: action)
        self.navigationItem.rightBarButtonItem = barButtonItem
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
