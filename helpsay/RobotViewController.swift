//
//  RobotViewController.swift
//  helpsay
//
//  Created by shipl on 15/9/14.
//  Copyright (c) 2015年 shipl. All rights reserved.
//

import UIKit
import AVFoundation

class RobotViewController: UIViewController {
    
    //declare avplayer
    var audioPlayer: AVAudioPlayer?
    
    //body parts rect declare
    private var headRect, leftEyeRect, rightEyeRect, leftEarRect, rightEarRect,
                toothRect, chestRect, abdomenRect, leftArmRect, rightArmRect, leftHandRect, rightHandRect,
                leftLegRect, rightLegRect, leftFootRect, rightFootRect : CGRect?
    
    
    private var animImageView : UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        
        
        self.audioPlayer = AVAudioPlayer();
        
        //get machine name
        let modelName = UIDevice.currentDevice().modelName
        
        //set robot body parts rect, animImageView frame images
        setRectValueByModel(modelName)
        
        //add animImageView
        self.view.addSubview(animImageView!)
        self.view.sendSubviewToBack(animImageView!)
        
        //add tap to robot
        addImageViewTaps();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setRectValueByModel(modelName: String){
        
        
    
        if (modelName == "Simulator"){
            
            //animImageView = UIImageView(frame: CGRectMake(135, 270, 78, 20))
        
            headRect = CGRectMake(60, 100, 200, 70)
            
            leftEyeRect = CGRectMake(115, 190, 50, 50)
            rightEyeRect =  CGRectMake(215, 190, 50, 50)
            
            leftEarRect = CGRectMake(50, 190, 50, 50)
            rightEarRect =  CGRectMake(305, 190, 50, 50)
            
            toothRect = CGRectMake(135, 270, 120, 50)
            
            chestRect = CGRectMake(150, 350, 80, 50)
        
            abdomenRect = CGRectMake(160, 400, 50, 50)
            
            leftArmRect = CGRectMake(80, 390, 50, 50)
            rightArmRect = CGRectMake(240, 400, 50, 50)
            
            
            leftHandRect = CGRectMake(80, 450, 50, 50)
            rightHandRect = CGRectMake(240, 450, 50, 50)
            
            
            leftLegRect = CGRectMake(130, 500, 50, 50)
            rightLegRect = CGRectMake(200, 500, 50, 50)
            
            leftFootRect = CGRectMake(130, 550, 50, 50)
            rightFootRect = CGRectMake(200, 550, 50, 50)
        }
        
        self.animImageView  = UIImageView(frame: CGRectMake(135, 270, 78, 20))
        var animImages = [UIImage]()
        animImages.append(UIImage(named: "robot_speak0")!)
        animImages.append(UIImage(named: "robot_speak1")!)
        animImages.append(UIImage(named: "robot_speak2")!)
        animImages.append(UIImage(named: "robot_speak3")!)
        animImages.append(UIImage(named: "robot_speak4")!)
        animImages.append(UIImage(named: "robot_speak5")!)
        self.animImageView?.animationImages = animImages;
        

        //animImageView!.animationImages = [UIImage]()
        //animImageView!.animationImages?.append(UIImage(named: "robot_speadk0")!)
        
        
    }
    
    //for imageviews add tap gesture
    func addImageViewTaps(){
        
        for view in self.view.subviews  {
            if view.isKindOfClass(UIImageView){
                var imgView = view as! UIImageView
                let tapGesture = UITapGestureRecognizer(target: self, action: Selector("handleTap:"))
                imgView.addGestureRecognizer(tapGesture)
                imgView.userInteractionEnabled = true
            }
        }
        
    }
    
    
    //image tap  handle
    func handleTap(recognizer: UITapGestureRecognizer) {
        
        var tapPoint: CGPoint = recognizer.locationInView(self.view)
        
        if (headRect!.contains(tapPoint)){
            
            NSLog("click head x=%f y=%f", tapPoint.x, tapPoint.y)
            
            self.view.bringSubviewToFront(self.animImageView!);
            
            self.animImageView?.startAnimating();
            
        
        } else if (leftEyeRect!.contains(tapPoint) || rightEyeRect!.contains(tapPoint)){
            
            NSLog("click eye x=%f y=%f", tapPoint.x, tapPoint.y)
            
        } else if (leftEarRect!.contains(tapPoint) || rightEarRect!.contains(tapPoint)){
            
            NSLog("click ear x=%f y=%f", tapPoint.x, tapPoint.y)
            
        } else if (toothRect!.contains(tapPoint)){
        
            NSLog("click tooth x=%f y=%f", tapPoint.x, tapPoint.y)
        
        } else if (chestRect!.contains(tapPoint)){
            
            NSLog("click chest x=%f y=%f", tapPoint.x, tapPoint.y)

        
        } else if (abdomenRect!.contains(tapPoint)){
        
            NSLog("click abdome x=%f y=%f", tapPoint.x, tapPoint.y)
        
        } else if (leftArmRect!.contains(tapPoint) || rightArmRect!.contains(tapPoint)){
        
            NSLog("click arm x=%f y=%f", tapPoint.x, tapPoint.y)
        
        } else if (leftHandRect!.contains(tapPoint) || rightHandRect!.contains(tapPoint)){
    
            NSLog("click hand x=%f y=%f", tapPoint.x, tapPoint.y)
    
        } else if (leftLegRect!.contains(tapPoint) || rightLegRect!.contains(tapPoint)){
            
            NSLog("click leg x=%f y=%f", tapPoint.x, tapPoint.y)
            
        } else if (leftFootRect!.contains(tapPoint) || rightFootRect!.contains(tapPoint)){
            
            NSLog("click foot x=%f y=%f", tapPoint.x, tapPoint.y)
            
        } else{
            
            NSLog("please click correct point  x=%f y=%f", tapPoint.x, tapPoint.y)
            
            self.view.sendSubviewToBack(self.animImageView!);
            self.animImageView?.stopAnimating();
        }
        

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
