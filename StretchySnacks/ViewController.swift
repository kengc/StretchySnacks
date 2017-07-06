//
//  ViewController.swift
//  StretchySnacks
//
//  Created by Kevin Cleathero on 2017-07-05.
//  Copyright © 2017 Kevin Cleathero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet var naveBarView: UIView!
    
    @IBOutlet var plusButton: UIButton!
    
    @IBOutlet var navBarHeightContraint: NSLayoutConstraint!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
           }




    @IBAction func plusButtonAction(_ sender: UIButton) {
        animateNavBar()
        rotateIcon()
    }
    
    func animateNavBar(){
        print("plus icon pressed")
        
        if self.navBarHeightContraint.constant == 60 {
            
            //constraint change animation so the animation goes after and this constant change doesn't
            //need to be placed in the animation block..just the self.view
            self.navBarHeightContraint.constant = 200
 
            
            UIView.animate(withDuration: 1.0,
                           delay: 0.0,
                           usingSpringWithDamping: 0.3,
                           initialSpringVelocity: 0.8,
                           options: .curveLinear,
                           animations: {
                            self.view.layoutIfNeeded()
            }, completion: {
                (value: Bool) in
            })
        } else {
            //bounce back to position
            self.navBarHeightContraint.constant = 60
            UIView.animate(withDuration: 1.0,
                           delay: 0.0,
                           usingSpringWithDamping: 0.3,
                           initialSpringVelocity: 0.8,
                           options: .curveLinear,
                           animations: {
                            self.view.layoutIfNeeded()
            }, completion: {
                (value: Bool) in
            })

        }
    }
    
    //this is animations with autolayout
    func rotateIcon(){
        print(self.plusButton.transform)
        
        if(self.plusButton.transform.a == 1.0){
            
            //self.plusButton.transform = CGAffineTransform(rotationAngle: 2.0)
                
            //print(self.plusButton.transform)
            
            UIView.animate(withDuration: 1.0,
                           delay: 0.0,
                           usingSpringWithDamping: 0.3,
                           initialSpringVelocity: 0.8,
                           options: .curveLinear,
                           animations: {
                            
                            //need this here because its a transform not a contraint
                            self.plusButton.transform = CGAffineTransform(rotationAngle: 2.0)
                            //self.plusButton.layoutIfNeeded()
            }, completion: {
                (value: Bool) in
            })
        } else {
            
            //            self.plusButton.transform.a = 1.0
            //            self.plusButton.transform.b = 0.0
            //            self.plusButton.transform.c = 0.0
            //            self.plusButton.transform.d = 1.0
         
            UIView.animate(withDuration: 1.0,
                           delay: 0.0,
                           usingSpringWithDamping: 0.3,
                           initialSpringVelocity: 0.8,
                           options: .curveLinear,
                           animations: {
                            
                            //need this here because its a transform not a contraint
                            self.plusButton.transform = CGAffineTransform(rotationAngle: 0.0)
                            //self.plusButton.layoutIfNeeded()
            }, completion: {
                (value: Bool) in
            })


        }
    }
}

