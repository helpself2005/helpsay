//
//  SceneViewController.swift
//  helpsay
//
//  Created by shipl on 15/9/14.
//  Copyright (c) 2015年 shipl. All rights reserved.
//

import UIKit

class SceneViewController: RootViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "点场景"

        // Do any additional setup after loading the view.
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
    
    
    //初始化窗体
    convenience init(){
        var nibNameOrNil = String?("SceneViewController")
        
        self.init(nibName: nibNameOrNil, bundle: NSBundle.mainBundle())
    }

}
