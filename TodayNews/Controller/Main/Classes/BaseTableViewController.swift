//
//  BaseTableViewController.swift
//  BookReader
//
//  Created by gejiangs on 16/6/14.
//  Copyright © 2016年 gejiangs. All rights reserved.
//

import UIKit

class BaseTableViewController: BaseViewController,UITableViewDataSource, UITableViewDelegate {
    
    var tableView:UITableView?;
    var contentList:NSMutableArray?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.contentList = NSMutableArray();
//        self.setTableViewStyle(UITableViewStyle.plain);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setTableViewStyle(_ style:UITableViewStyle)
    {
        if (self.tableView != nil)
        {
            self.tableView?.removeFromSuperview();
            self.tableView = nil;
        }
        self.tableView = UITableView(frame: self.view.bounds, style: style);
        self.tableView?.delegate = self;
        self.tableView?.dataSource = self;
        self.view.addSubview(self.tableView!);
    }
    
    // MARK: - Table view data source
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contentList!.count
    }

    
    func tableView(tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if(cell == nil){
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        }

        return cell!
    }
    

}
