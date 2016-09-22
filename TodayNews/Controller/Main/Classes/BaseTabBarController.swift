//
//  BaseTabBarController.swift
//  ShopLine
//
//  Created by gejiangs on 16/6/22.
//  Copyright © 2016年 gejiangs. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        let titles = ["首页", "消息", "我的"]
//        let normals = ["home_btn_home", "home_btn_email", "home_btn_me"]
//        let selecteds = ["home_btn_home_pre", "home_btn_email_pre", "home_btn_me_pre"]
//        
//        for item in titles.enumerated() {
//            let vc = self.viewControllers![item.index] 
//            let barItem = UITabBarItem(title: item.element, image: UIImage(named: normals[item.index]), selectedImage: UIImage(named: selecteds[item.index]))
//            vc.tabBarItem = barItem
//        }
        
        self.tabBar.backgroundColor = UIColor.white
        self.tabBar.tintColor = UIColor.red
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
