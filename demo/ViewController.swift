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
        

        // case1:
        var color = UIColor(red: 25/255, green: 144/255, blue: 211/255, alpha: 1)
        self.navigationController?.navigationBar.overlayColor = color
        
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        // case2:
//        self.navigationController?.navigationBar.jh_heightReset()
        
        // case1:
        self.navigationController?.navigationBar.jh_colorReset()
    }
    
    override func viewWillAppear(animated: Bool) {
        //need
        self.scrollViewDidScroll(tableView)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
//         case1:
        JHNavBarHandle.handleJHNavigationBarColor(scrollView, uiviewcontoller: self)
        
        
        //case2:
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

