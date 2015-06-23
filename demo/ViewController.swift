//
//  ViewController.swift
//  demo
//
//  Created by JiaHao on 6/23/15.
//  Copyright (c) 2015 JH. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // T1:
        var color = UIColor(red: 25/255, green: 144/255, blue: 211/255, alpha: 1)
        self.navigationController?.navigationBar.overlayColor = color
        
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
//         T1:
        self.navigationController?.navigationBar.jh_reset()
    }
    override func viewWillAppear(animated: Bool) {
//         T1:
        self.scrollViewDidScroll(tableView)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
//         T1:
        JHNavBarHandle.handleJHNavigationBarColor(scrollView, uiviewcontoller: self)
        
        
        //T2:
//        JHNavBarHandle.handleJHNavigationBarHeight(scrollView, uiviewcontoller: self)
        
    }

}



extension ViewController:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! UITableViewCell
        cell.textLabel?.text = "test\(indexPath.row)"
        return cell;
    }
}

