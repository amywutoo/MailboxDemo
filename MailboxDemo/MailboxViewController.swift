//
//  MailboxViewController.swift
//  MailboxDemo
//
//  Created by Amy Wu on 10/30/16.
//  Copyright © 2016 Amy Wu. All rights reserved.
//

import UIKit

class MailboxViewController: UIViewController, UIScrollViewDelegate, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var messageParentView: UIView!
    @IBOutlet weak var messageImage: UIImageView!
    @IBOutlet weak var laterImage: UIImageView!
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var brownView: UIView!
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var listImage: UIImageView!
    @IBOutlet weak var archiveImage: UIImageView!
    @IBOutlet weak var backgroundView: UIView!
    
    var messageImageOriginalCenter: CGPoint!
    var archiveImageOriginalCenter: CGPoint!
    var laterImageOriginalCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = imageView.frame.size
        
        archiveImage.alpha = 1
        laterImage.alpha  = 1

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func panMessageParent(_ sender: UIPanGestureRecognizer) {
        
        //let location = sender.location(in: view)
        let velocity = sender.velocity(in: view)
        let translation = sender.translation(in: view)
        
        
        if sender.state == .began {
            //print("Gesture began")
            messageImageOriginalCenter = messageImage.center
            archiveImageOriginalCenter = archiveImage.center
            laterImageOriginalCenter = laterImage.center

            
        } else if sender.state == .changed {
            //print("Gesture is changing")
            
            messageImage.center = CGPoint(x: messageImageOriginalCenter.x + translation.x, y: messageImageOriginalCenter.y)
            
            if velocity.x < 0 && translation.x < -65 {
                
                laterImage.center = CGPoint(x: laterImageOriginalCenter.x + translation.x, y: laterImageOriginalCenter.y)
                
            } else if velocity.x >= 0 && translation.x >= 65 {
                
                archiveImage.center = CGPoint(x: archiveImageOriginalCenter.x + translation.x , y: archiveImageOriginalCenter.y)
                
            } else {
                
                archiveImage.center = CGPoint(x: archiveImageOriginalCenter.x, y: archiveImageOriginalCenter.y)
                laterImage.center = CGPoint(x: laterImageOriginalCenter.x, y: laterImageOriginalCenter.y)

            }
            

        } else if sender.state == .ended {
            //print("Gesture ended")
            
            

        }

        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
