//
//  RootViewController.swift
//  helpsay
//
//  Created by shipl on 15/9/14.
//  Copyright (c) 2015年 shipl. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController, UITabBarControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        loadViewController();
        
        self.tabBar.barTintColor = UIColor.whiteColor();
        
        self.tabBar.tintColor = UIColor(red: 255.0/255.0, green: 124.0/255.0, blue: 56.0/255.0, alpha: 1);
        
        self.selectedIndex = 1;
        self.navigationItem.title = "点场景"
        
        self.delegate = self
        
        initSetting()
        
    }
    
    func initSetting(){
        var settingButton = UIBarButtonItem(title: "设置", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("handleSettings"))
        self.navigationItem.rightBarButtonItem = settingButton
    }
    
    
    func handleSettings(){
        var settingVC = SettingViewController()
        self.navigationController?.pushViewController(settingVC, animated: true)
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
    
    
    
    func loadViewController(){
        
        //TODO 需要更改底部界面图形和字体
        
        var robotVC = RobotViewController();
        robotVC.tabBarItem = UITabBarItem(title: "点部位", image: UIImage(named: "blank") , tag: 2);
        
        var sceneVC = SceneViewController();
        sceneVC.tabBarItem = UITabBarItem(title: "点场景", image: UIImage(named: "blank") , tag: 1);
        
        var hisVC = HisViewController();
        hisVC.tabBarItem = UITabBarItem(title: "点历史", image: UIImage(named: "blank") , tag: 3);
        
        self.setViewControllers([robotVC, sceneVC, hisVC], animated: true);
    }
    
    
    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController){
    
        self.navigationItem.title = viewController.title;
    
    }

}
