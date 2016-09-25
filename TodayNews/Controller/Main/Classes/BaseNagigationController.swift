//
//  BaseNagigationController.swift
//  BookReader
//
//  Created by gejiangs on 16/6/14.
//  Copyright © 2016年 gejiangs. All rights reserved.
//

import UIKit

class BaseNagigationController: UINavigationController, UINavigationControllerDelegate, UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

//        self.navigationBar.setBackgroundImage(UIImage(named: "home_top_bg"), for: UIBarMetrics.default)
//        self.navigationBar.isTranslucent = false
//        self.interactivePopGestureRecognizer?.delegate = self
//        self.navigationBar.tintColor = UIColor.black
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
