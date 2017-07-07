//
//  ViewController.swift
//  StretchySnacks
//
//  Created by Kevin Cleathero on 2017-07-05.
//  Copyright © 2017 Kevin Cleathero. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //@IBOutlet var snacksLabel: UILabel!
   
    @IBOutlet var tableView: UITableView!
    @IBOutlet var naveBarView: UIView!
    
    @IBOutlet var centerY: NSLayoutConstraint!
    
    @IBOutlet var plusButton: UIButton!
    
    @IBOutlet var navBarHeightContraint: NSLayoutConstraint!
    
        @IBOutlet var navBarLabelContraint: NSLayoutConstraint!
    
    var stackView: UIStackView = UIStackView()
    var labelHeight : NSLayoutConstraint!
    
    var itemArray = [String]()
    
    @IBInspectable var navBarLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //hack to get SNACKS showing doesnt really work because it's stiff and doesn't bounce with the animation
//            snacksLabel.text = "SNACKS"
//            snacksLabel.isHidden = true
            setupNavBar()
           }


//MARK - setup nav bar

    func setupNavBar(){
       
        //stackView.isHidden = true
        
         //add 5 images, as buttons so i can add to the table, to stackview
        
        
        let oreoButton: UIButton = UIButton()
        oreoButton.heightAnchor.constraint(equalToConstant: 120.0).isActive = true
        oreoButton.widthAnchor.constraint(equalToConstant: self.view.frame.size.width/5.0).isActive = true
        oreoButton.tag = 1
        oreoButton.addTarget(self, action: #selector(self.addToTable), for: .touchUpInside)
        oreoButton.setImage(UIImage(named: "oreos"), for: [])
        
       
        let pizzaPocketButton: UIButton = UIButton()
        pizzaPocketButton.heightAnchor.constraint(equalToConstant: 120.0).isActive = true
        pizzaPocketButton.widthAnchor.constraint(equalToConstant: self.view.frame.size.width/5.0).isActive = true
        pizzaPocketButton.tag = 2
        pizzaPocketButton.addTarget(self, action: #selector(self.addToTable), for: .touchUpInside)
        pizzaPocketButton.setImage(UIImage(named: "pizza_pockets"), for: [])
 
        
        let popTartButton: UIButton = UIButton()
        popTartButton.heightAnchor.constraint(equalToConstant: 120.0).isActive = true
        popTartButton.widthAnchor.constraint(equalToConstant: self.view.frame.size.width/5.0).isActive = true
        popTartButton.tag = 3
        popTartButton.addTarget(self, action: #selector(self.addToTable), for: .touchUpInside)
        popTartButton.setImage(UIImage(named: "pop_tarts"), for: [])
        
        let popsicleButton: UIButton = UIButton()
        popsicleButton.heightAnchor.constraint(equalToConstant: 120.0).isActive = true
        popsicleButton.widthAnchor.constraint(equalToConstant: self.view.frame.size.width/5.0).isActive = true
        popsicleButton.tag = 4
        popsicleButton.addTarget(self, action: #selector(self.addToTable), for: .touchUpInside)
        popsicleButton.setImage(UIImage(named: "popsicle"), for: [])
        
        let ramenButton: UIButton = UIButton()
        ramenButton.heightAnchor.constraint(equalToConstant: 120.0).isActive = true
        ramenButton.widthAnchor.constraint(equalToConstant: self.view.frame.size.width/5.0).isActive = true
        ramenButton.tag = 5
        ramenButton.addTarget(self, action: #selector(self.addToTable), for: .touchUpInside)
        ramenButton.setImage(UIImage(named: "ramen"), for: [])
        
        // Stack View setting
        stackView.axis = UILayoutConstraintAxis.horizontal
        stackView.distribution = UIStackViewDistribution.equalSpacing
        stackView.alignment = UIStackViewAlignment.center
        stackView.isHidden = true
        stackView.translatesAutoresizingMaskIntoConstraints = false;
        stackView.spacing = 0.0
    
        
        navBarLabel.text = "SNACKS"
        navBarLabel.textAlignment = .center
        navBarLabel.isEnabled = true
        navBarLabel.isHidden = false
        navBarLabel.alpha = 1.0
        navBarLabel.translatesAutoresizingMaskIntoConstraints = false;
        //stackView.addSubview(navBarLabel)
     
        
        stackView.addArrangedSubview(oreoButton)
        stackView.addArrangedSubview(pizzaPocketButton)
        stackView.addArrangedSubview(popTartButton)
        stackView.addArrangedSubview(popsicleButton)
        stackView.addArrangedSubview(ramenButton)
        
        self.naveBarView.addSubview(stackView)
        self.naveBarView.addSubview(navBarLabel)
        
       
        stackView.centerXAnchor.constraint(equalTo: naveBarView.centerXAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: naveBarView.bottomAnchor).isActive = true
    
        //set label X coord to the middle of the navbar view
        //navBarLabel.topAnchor.constraint(equalTo: naveBarView.topAnchor).isActive = true
        navBarLabel.centerXAnchor.constraint(equalTo: naveBarView.centerXAnchor).isActive = true
        
        //creates a new contraint when we assign it then we have to activate it
        navBarLabelContraint = navBarLabel.centerYAnchor.constraint(equalTo: naveBarView.centerYAnchor)
        navBarLabelContraint.isActive = true
        
        
        
    }
    
    func addToTable(sender: UIButton) {
        switch (sender.tag) {
        case 1:
            let Oreo = "Oreo"
            itemArray.append(Oreo)
        case 2:
            let PizzaPocket = "PizzaPocket"
            itemArray.append(PizzaPocket)
        case 3:
            let PopTart = "PopTart"
            itemArray.append(PopTart)
        case 4:
            let Popsicle = "Popsicle"
            itemArray.append(Popsicle)
        case 5:
            let Ramen = "Ramen"
            itemArray.append(Ramen)
        default:
            print("no item")
        }
        tableView.reloadData()
    }


//MARK - Animations
    
    func animateNavBar(){
        print("plus icon pressed")
        
        if self.navBarHeightContraint.constant == 60 {
            //snacksLabel.isHidden = true
            
            //constraint change animation so the animation goes after and this constant change doesn't
            //need to be placed in the animation block..just the self.view
            self.navBarHeightContraint.constant = 200
            stackView.isHidden = false
            
            navBarLabel.text = "add a SNACK"
            
            navBarLabelContraint.constant = -40  //offset
            
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
             navBarLabelContraint.constant = 0
            //snacksLabel.isHidden = false
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
            stackView.isHidden = true
            navBarLabel.text = "SNACKS"
        }
    }
    
//MARK - Table View delegates
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item
        return cell
    }
    
    
//MARK - Plus Button Action
    @IBAction func plusButtonAction(_ sender: UIButton) {
        animateNavBar()
        rotateIcon()
    }
}

