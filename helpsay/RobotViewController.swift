//
//  RobotViewController.swift
//  helpsay
//
//  Created by shipl on 15/9/14.
//  Copyright (c) 2015年 shipl. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class RobotViewController: UIViewController, AVAudioPlayerDelegate {
    
    //declare avplayer
    var audioPlayer: AVAudioPlayer?
    
    //body parts rect declare
    private var headRect, leftEyeRect, rightEyeRect, leftEarRect, rightEarRect,
                toothRect, chestRect, abdomenRect, leftArmRect, rightArmRect, leftHandRect, rightHandRect,
                leftLegRect, rightLegRect, leftFootRect, rightFootRect : CGRect?
    
    
    private var animImageView : UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "点部位"
        
        //let nextItem = UIBarButtonItem(title: "下一页", style: .Plain, target: self, action: "next")
        //self.navigationItem.rightBarButtonItem = nextItem
        
        // Do any additional setup after loading the view.
        
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
        
        switch(modelName){
        
        case "iPhone 6 Plus":
        
            headRect = CGRectMake(100, 110, 200, 70)
            
            leftEyeRect = CGRectMake(120, 230, 50, 50)
            rightEyeRect =  CGRectMake(240, 230, 50, 50)
            
            leftEarRect = CGRectMake(50, 230, 50, 50)
            rightEarRect =  CGRectMake(320, 230, 50, 50)
            
            
            toothRect = CGRectMake(150, 300, 120, 50)
            
            chestRect = CGRectMake(170, 400, 80, 50)
            
            abdomenRect = CGRectMake(180, 450, 50, 50)
            
            leftArmRect = CGRectMake(90, 450, 50, 50)
            rightArmRect = CGRectMake(270, 450, 50, 50)
            
            
            leftHandRect = CGRectMake(70, 450, 50, 50)
            rightHandRect = CGRectMake(270, 450, 50, 50)
            
            
            leftLegRect = CGRectMake(140, 560, 50, 50)
            rightLegRect = CGRectMake(215, 560, 50, 50)
            
            leftFootRect = CGRectMake(140, 610, 50, 50)
            rightFootRect = CGRectMake(215, 610, 50, 50)
            
            self.animImageView  = UIImageView(frame: CGRectMake(170, 300, 80, 20))
            
        default:
            
            headRect = CGRectMake(60, 100, 200, 70)
            
            leftEyeRect = CGRectMake(115, 190, 50, 50)
            rightEyeRect =  CGRectMake(215, 190, 50, 50)
            
            leftEarRect = CGRectMake(50, 190, 50, 50)
            rightEarRect =  CGRectMake(305, 190, 50, 50)
            
            toothRect = CGRectMake(150, 300, 120, 50)
            
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
            
            self.animImageView  = UIImageView(frame: CGRectMake(140, 270, 78, 20))
        }

        
        var animImages = [UIImage]()
        animImages.append(UIImage(named: "robot_speak0")!)
        animImages.append(UIImage(named: "robot_speak1")!)
        animImages.append(UIImage(named: "robot_speak2")!)
        animImages.append(UIImage(named: "robot_speak3")!)
        animImages.append(UIImage(named: "robot_speak4")!)
        animImages.append(UIImage(named: "robot_speak5")!)
        
        self.animImageView?.animationImages = animImages;

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
    
    //create player play body part sound
    func createAVAudioPlayer(fileName: String)-> AVAudioPlayer{
        var e : NSError?
        let url = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource(fileName, ofType: "mp3")!)
        
        var audioPlayer = AVAudioPlayer(contentsOfURL: url, error: &e)
        
        if let error = e{
            NSLog("audioPlayer error \(error.localizedDescription)")
        }
        else{
            audioPlayer.delegate = self;
            audioPlayer.prepareToPlay();
        }
        
        return audioPlayer
    }
    
    
    //image tap  handle
    func handleTap(recognizer: UITapGestureRecognizer) {
        
        var playTag = true
        
        var tapPoint: CGPoint = recognizer.locationInView(self.view)
        
        if (headRect!.contains(tapPoint)){
            
            self.audioPlayer = createAVAudioPlayer("robot_head")
            
        
        } else if (leftEyeRect!.contains(tapPoint) || rightEyeRect!.contains(tapPoint)){
            
            self.audioPlayer = createAVAudioPlayer("robot_eye")
            
        } else if (leftEarRect!.contains(tapPoint) || rightEarRect!.contains(tapPoint)){
            
            self.audioPlayer = createAVAudioPlayer("robot_head")
            
        } else if (toothRect!.contains(tapPoint)){
        
            self.audioPlayer = createAVAudioPlayer("robot_head")
        
        } else if (chestRect!.contains(tapPoint)){
            
            self.audioPlayer = createAVAudioPlayer("robot_chest")
        
        } else if (abdomenRect!.contains(tapPoint)){
        
            self.audioPlayer = createAVAudioPlayer("robot_belly")
        
        } else if (leftArmRect!.contains(tapPoint) || rightArmRect!.contains(tapPoint)){
        
            self.audioPlayer = createAVAudioPlayer("robot_arm")
        
        } else if (leftHandRect!.contains(tapPoint) || rightHandRect!.contains(tapPoint)){
    
            self.audioPlayer = createAVAudioPlayer("robot_arm")
    
        } else if (leftLegRect!.contains(tapPoint) || rightLegRect!.contains(tapPoint)){
            
            self.audioPlayer = createAVAudioPlayer("robot_leg")
            
        } else if (leftFootRect!.contains(tapPoint) || rightFootRect!.contains(tapPoint)){
            
            self.audioPlayer = createAVAudioPlayer("robot_foot")
            
        } else{
            
            playTag = false

        }
        
        if playTag {
        
            if (self.audioPlayer != nil){
                self.audioPlayer!.play();
            }

            self.view.bringSubviewToFront(self.animImageView!);
            self.animImageView?.startAnimating();
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
    
    //AVAudioPlayer play over do
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer!, successfully flag: Bool) {
        self.view.sendSubviewToBack(self.animImageView!);
        self.animImageView?.stopAnimating();
    }
    
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
