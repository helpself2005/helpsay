//
//  RobotViewController.swift
//  helpsay
//
//  Created by shipl on 15/9/14.
//  Copyright (c) 2015年 shipl. All rights reserved.
//

import UIKit

class RobotViewController: UIViewController {

    @IBOutlet weak var robotImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        //robotImg.addGestureRecognizer(UITapGestureRecognizer(target: self,   action: "touchesBegan"))
        robotImg.userInteractionEnabled = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        NSLog("点击位置获取")

        
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
        var nibNameOrNil = String?("RobotViewController")

        self.init(nibName: nibNameOrNil, bundle: NSBundle.mainBundle())
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }
    
    
}
