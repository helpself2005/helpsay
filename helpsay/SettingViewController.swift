//
//  SettingViewController.swift
//  helpsay
//
//  Created by shipl on 15/9/14.
//  Copyright (c) 2015年 shipl. All rights reserved.
//

import UIKit

class SettingViewController: RootViewController {

    @IBOutlet weak var addSceneBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "系统设置"
        // Do any additional setup after loading the view..
     
        //var backItem = UIBarButtonItem(title: "返回", style: UIBarButtonItemStyle.Plain, target: self, action: "handleBack")
        //self.navigationItem.leftBarButtonItem = backItem
        
        addSceneBtn.addTarget(self, action: Selector("addSceneBtnClick:"), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func handleBack(){
        
        self.navigationController?.popViewControllerAnimated(true)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addSceneBtnClick(button: UIButton){
        var addSceneView = AddSceneViewController();
        self.navigationController?.pushViewController(addSceneView, animated: true)
    
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
        var nibNameOrNil = String?("SettingViewController")
        
        self.init(nibName: nibNameOrNil, bundle: NSBundle.mainBundle())
    }
    

}
