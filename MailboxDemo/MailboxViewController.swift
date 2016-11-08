//
//  MailboxViewController.swift
//  MailboxDemo
//
//  Created by Amy Wu on 11/4/16.
//  Copyright © 2016 Amy Wu. All rights reserved.
//

import UIKit

class MailboxViewController: UIViewController {

    // Outlets and declare variables
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var messageImageView: UIImageView!
    @IBOutlet weak var messageContainerView: UIView!
    
    @IBOutlet weak var leftSideIcon: UIImageView!
    
    
    // <-60
    
    // <-260
    
    // <=60 && >=(-60)
    let grayColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    // >60
    let laterIcon = #imageLiteral(resourceName: "later_icon")
    let greenColor = #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)
    // > 260
    let listIcon = #imageLiteral(resourceName: "list_icon")
    let redColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
    
    
    var messageViewOriginalCenter: CGPoint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Anything we want to happen when the view first loads
        // Give initial values to objects / views
        
        scrollView.contentSize.width = scrollView.frame.size.width
        scrollView.contentSize.height = feedImageView.frame.origin.y + feedImageView.frame.size.height
        
        
    }
    
    
    // Put our functions / methods
    
    // 60pt
    // 260pt
    
    @IBAction func didPanMessage(_ sender: UIPanGestureRecognizer) {
        
        let translation = sender.translation(in: view)
        print(translation.x)
        
        if sender.state == .began {
            // get a reference to where the message view is in the beggining so we can offset by the translation amount
            
            messageViewOriginalCenter = messageImageView.center
            
        } else if sender.state == .changed {
            // update the position of the message view
            messageImageView.center.x = messageViewOriginalCenter.x + translation.x
            
            if translation.x > 260 {
                messageContainerView.backgroundColor = redColor
                leftSideIcon.image = #imageLiteral(resourceName: "delete_icon")
                leftSideIcon.center.x = messageImageView.frame.origin.x - 30
            } else if translation.x > 60 {
                messageContainerView.backgroundColor = greenColor
                leftSideIcon.image = #imageLiteral(resourceName: "archive_nav_icon")
                leftSideIcon.center.x = messageImageView.frame.origin.x - 30
            } else if translation.x >= -60 && translation.x <= 60 {
                messageContainerView.backgroundColor = grayColor
                leftSideIcon.image = #imageLiteral(resourceName: "archive_nav_icon")
            }
            
            
        } else if sender.state == .ended {
            // Decide to animate to off screen left / right / back to original position
            if translation.x > 260 {
                UIView.animate(withDuration: 0.3, animations: { 
                    self.messageImageView.center.x += 375
                    self.leftSideIcon.center.x += 375
                    }, completion: { (Bool) in
                        // show list secreen now that animation finished
                        // 
                })
                
            } else if translation.x > 60 {
                UIView.animate(withDuration: 0.3, animations: {
                    self.messageImageView.center.x += 375
                    self.leftSideIcon.center.x += 375
                    }, completion: { (Bool) in
                        // show reschedule screen now that animation finished
                        // rescheduleView.alpha = 1
                        UIView.animate(withDuration: 0.3, animations: { 
                            self.feedImageView.frame.origin.y -= self.messageImageView.frame.size.height
                        })
                })
                

                
            } else if translation.x >= -60 && translation.x <= 60 {
                
                UIView.animate(withDuration: 0.3, animations: { 
                    self.messageImageView.center.x = self.messageViewOriginalCenter.x
                })
                
                
            }
            

            
            
            
            
            
        }
    }
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    

    
}
