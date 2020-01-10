//
//  ViewController.swift
//  exercise1
//
//  Created by MacStudent on 2020-01-09.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let height = 25
    let width = 25
    let screenHeight = UIScreen.main.bounds.height

    var timer = Timer()
    var downFlag = true
    var swiped = false
    var topFlag = true

    var leftSwipe = false
    var rightSwipe = false
    
    @IBOutlet weak var square: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        square.frame = CGRect(x: 0, y: 0, width: width, height: height)
        downAnimation()
        
//        UIView.animate(withDuration: 7, delay: 0.1, options: [.autoreverse, .repeat], animations: {
//
//                    self.square.frame = CGRect(x: 0, y: Int(UIScreen.main.bounds.height) - self.height, width: self.width, height: self.height)
//
//                }, completion: nil)
//
//             initializeTimer()
//
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipped))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        view.addGestureRecognizer(swipeLeft)



        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipped))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        view.addGestureRecognizer(swipeRight)

    }
    
    func initializeTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        
        
        if downFlag{
            UIView.animate(withDuration: 0.1) {
                let y = self.square.frame.origin.y

                self.square.frame = CGRect(x: 0, y: Int(y + 15), width: self.width, height: self.height)
            }
            
            if square.frame.minY >= screenHeight - 30{
                timer.invalidate()
                downFlag = false
                if swiped{
//                    animations()
                } else{
                    initializeTimer()
                }
                
            }
            
            
        } else{
            UIView.animate(withDuration: 0.1) {
                let y = self.square.frame.origin.y

                   self.square.frame = CGRect(x: 0, y: Int(y - 15), width: self.width, height: self.height)
               }
               
               if square.frame.minY <= 0{
                   timer.invalidate()
                   downFlag = true
                    
                }
                
                initializeTimer()
                
            }
        }
    
    func downAnimation(){
        
        UIView.animate(withDuration: 2, animations: {
            self.square.frame = CGRect(x: 0, y: Int(UIScreen.main.bounds.height) - self.height, width: self.width, height: self.height)
        }) { (a) in
            
            if (self.leftSwipe){
                //C animation
                print("clockwise")
                self.ClockwiseAnimations()
            }else if (self.rightSwipe){
                // AC animation
                print("anti-clock")
                self.CounterClockAnimations()
            }else{
                self.upAnimation()
            }
        
            
        }
        
    }
    
    func upAnimation(){
        UIView.animate(withDuration: 2, animations: {
                 self.square.frame = CGRect(x: 0, y: 0, width: self.width, height: self.height)
               }) { (a) in
                
                if (self.leftSwipe){
                    //AC animation
                }else if (self.rightSwipe){
                    // AC animation
                }else{
                    self.downAnimation()
                }
                
               }
    }
    

    
            

    @objc func swipped(gesture: UISwipeGestureRecognizer){



        switch gesture.direction {

        case UISwipeGestureRecognizer.Direction.left:

            leftSwipe = true
            rightSwipe = false


        case UISwipeGestureRecognizer.Direction.right:
            
            leftSwipe = false
            rightSwipe = true
            
//            if downFlag{
//
//                swiped = true
//
//            }
//
            
            
        
//            if (square.frame.origin.y <= 100){
//
//                UIView.animate(withDuration: 7, delay: 0.1, options: [], animations: {
//
//                    self.square.frame = CGRect(x: Int(UIScreen.main.bounds.width) - self.width, y: 0, width: self.width, height: self.height)
//
//                }, completion: nil)
//
//            }
//
//            else {
        
//
//
//
//                    }


                default:

                    break

                }


    }
    
    func ClockwiseAnimations(){
        
        
        UIView.animateKeyframes(withDuration: 5, delay: 0, options: [.autoreverse, .repeat], animations: {

                    // Add animations

            UIView.addKeyframe(withRelativeStartTime: 0/5.0, relativeDuration: 1.0/5.0, animations: {


                self.square.frame = CGRect(x: 0, y: 0, width: self.width, height: self.height)

            })
            UIView.addKeyframe(withRelativeStartTime: 1.0/5.0, relativeDuration: 1.0/5.0, animations: {

                self.square.frame = CGRect(x: Int(UIScreen.main.bounds.width) - self.width, y: 0, width: self.width, height: self.height)

            })
            
                UIView.addKeyframe(withRelativeStartTime: 2.0, relativeDuration: 1.0/5.0, animations: {
                    self.square.frame = CGRect(x: Int(UIScreen.main.bounds.width) - self.width, y: Int(UIScreen.main.bounds.height) - self.height, width: self.width, height: self.height)

                })


                
                UIView.addKeyframe(withRelativeStartTime: 3.0/5.0, relativeDuration: 1.0/5.0, animations: {


                    self.square.frame = CGRect(x: 0, y: Int(UIScreen.main.bounds.height) - self.height, width: self.width, height: self.height)

                })


            }, completion:{ (complete) in
                print("complete")

            })
        
    }

func CounterClockAnimations(){
    
    
    UIView.animateKeyframes(withDuration: 5, delay: 0, options: [.autoreverse, .repeat], animations: {

                // Add animations

        
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1.0/5.0, animations: {
                self.square.frame = CGRect(x: Int(UIScreen.main.bounds.width) - self.width, y: Int(UIScreen.main.bounds.height) - self.height, width: self.width, height: self.height)

            })

            UIView.addKeyframe(withRelativeStartTime: 1.0/5.0, relativeDuration: 1.0/5.0, animations: {

                self.square.frame = CGRect(x: Int(UIScreen.main.bounds.width) - self.width, y: 0, width: self.width, height: self.height)

            })

            UIView.addKeyframe(withRelativeStartTime: 2.0/5.0, relativeDuration: 1.0/5.0, animations: {


                self.square.frame = CGRect(x: 0, y: 0, width: self.width, height: self.height)

            })
            UIView.addKeyframe(withRelativeStartTime: 3.0/5.0, relativeDuration: 1.0/5.0, animations: {


                self.square.frame = CGRect(x: 0, y: Int(UIScreen.main.bounds.height) - self.height, width: self.width, height: self.height)

            })


        }, completion:{ (complete) in
            print("complete")
//            if self.topFlag{
//                self.square.frame = CGRect(x: 0, y: Int(self.screenHeight) - self.height, width: self.width, height: self.height)
//
//                UIView.animate(withDuration: 7) {
//
//                    self.square.frame = CGRect(x: 0, y: 0, width: self.width, height: self.height)
//                }
//
//            self.topFlag = false
//            } else{
//
//                UIView.animate(withDuration: 7) {
//                    self.square.frame = CGRect(x: 0, y: Int(self.screenHeight) - self.height , width: self.width, height: self.height)
//                }
//                self.topFlag = true
//            }

            
            
//            self.initializeTimer()

        })
    
}

}
