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
    @IBOutlet weak var backgroundView: UIImageView!
    @IBOutlet weak var messageImage: UIImageView!
    @IBOutlet weak var laterImage: UIImageView!
    @IBOutlet weak var archiveImage: UIImageView!
    
    var messageImageOriginalCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = imageView.frame.size

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func panMessageParent(_ sender: UIPanGestureRecognizer) {
        
        let location = sender.location(in: view)
        let velocity = sender.velocity(in: view)
        let translation = sender.translation(in: view)
        
        if sender.state == .began {
            //print("Gesture began")
            
            
            
        } else if sender.state == .changed {
            //print("Gesture is changing")
            
            laterImage.alpha = 0.2
            archiveImage.alpha = 0.2
            
            laterImage.image = UIImage(named: "later_icon")
            archiveImage.image = UIImage(named: "archive_icon")
            
            backgroundView.backgroundColor = UIColor.lightGray
            


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
