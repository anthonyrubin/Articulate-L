//
//  ViewController.swift
//  firstapp
//
//  Created by Anthony Rubin on 6/13/17.
//  Copyright © 2017 rubin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var GoButton: UIButton!
    
    @IBOutlet weak var Background: UIImageView!
    
    @IBOutlet weak var SettingsButton: UIButton!
    
    
    @IBOutlet weak var aboutButton: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    
    @IBAction func unwindsegue(_ sender: UIStoryboardSegue){
    }
    
    override func viewWillLayoutSubviews() {
        if((view.frame.size.width == 896 && view.frame.size.height == 414)||(view.frame.size.width == 414 && view.frame.size.height == 896)){
            iphoneXR()
        }
        
        if(view.frame.size.width == 375 || view.frame.size.width == 812)&&(view.frame.size.height == 375 || view.frame.size.height == 812){
            iphoneX()
        }
        if(view.frame.size.width == 320 || view.frame.size.width == 568)&&(view.frame.size.height == 320 || view.frame.size.height == 568){
            iphoneSE()
        }
        
        if(view.frame.size.width == 414 || view.frame.size.width == 736)&&(view.frame.size.height == 414 || view.frame.size.height == 736){
            iphone8Plus()
        }
        
        if(view.frame.size.width == 375 || view.frame.size.width == 667)&&(view.frame.size.height == 375 || view.frame.size.height == 667){
            iphone8()
        }
        
        if(view.frame.size.width == 1024 || view.frame.size.width == 1366)&&(view.frame.size.height == 1024 || view.frame.size.height == 1366){
            ipadPro()
        }
        
        if(view.frame.size.width == 1112 || view.frame.size.width == 834)&&(view.frame.size.height == 1112 || view.frame.size.height == 834){
            ipad10inch()
        }
        
        if(view.frame.size.width == 768 || view.frame.size.width == 1024)&&(view.frame.size.height == 768 || view.frame.size.height == 1024){
            ipad9inch()
        }
    }
    func iphoneXR(){
        Background.contentMode = .scaleToFill
        Background.image = #imageLiteral(resourceName: "iphoneXBackground")
        
        GoButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 60)
        GoButton.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 230).isActive = true
        GoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 160).isActive = true
        view.bottomAnchor.constraint(equalTo: GoButton.bottomAnchor, constant: 80).isActive = true
        
        
        SettingsButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 33)
        view.trailingAnchor.constraint(equalTo: SettingsButton.trailingAnchor, constant: 615).isActive = true
        SettingsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80).isActive = true
        SettingsButton.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 154).isActive = true
        
        
        aboutButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        view.bottomAnchor.constraint(equalTo: aboutButton.bottomAnchor, constant: 34).isActive = true
        aboutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 320).isActive = true
        aboutButton.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 300).isActive = true
    }
    
    func iphoneX(){
        Background.contentMode = .scaleToFill
        Background.image = #imageLiteral(resourceName: "iphoneXBackground")
        
        
        GoButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 50)
        GoButton.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 220).isActive = true
        GoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 150).isActive = true
        view.bottomAnchor.constraint(equalTo: GoButton.bottomAnchor, constant: 88).isActive = true
        
        
        SettingsButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        view.trailingAnchor.constraint(equalTo: SettingsButton.trailingAnchor, constant: 575).isActive = true
        SettingsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 90).isActive = true
        SettingsButton.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 139).isActive = true
        
        
        aboutButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        view.bottomAnchor.constraint(equalTo: aboutButton.bottomAnchor, constant: 34).isActive = true
        aboutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 300).isActive = true
        aboutButton.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 280).isActive = true
    }
    func iphoneSE(){
        Background.contentMode = .scaleToFill
        Background.image = #imageLiteral(resourceName: "iphoneXBackground")
        view.bottomAnchor.constraint(equalTo: GoButton.bottomAnchor, constant: 75).isActive = true
        GoButton.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 195).isActive = true
        GoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 95).isActive = true
        
        
        view.trailingAnchor.constraint(equalTo: SettingsButton.trailingAnchor, constant: 400).isActive = true
        SettingsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60).isActive = true
        SettingsButton.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 120).isActive = true
        
        view.bottomAnchor.constraint(equalTo: aboutButton.bottomAnchor, constant:40).isActive = true
        
        aboutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 205).isActive = true
        aboutButton.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 245).isActive = true
        
        aboutButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        GoButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 45)
        SettingsButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        
    }
    func iphone8Plus(){
        Background.contentMode = .scaleToFill
        Background.image = #imageLiteral(resourceName: "iphoneXBackground")
        
        GoButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 50)
        view.bottomAnchor.constraint(equalTo: GoButton.bottomAnchor, constant: 94).isActive = true
        GoButton.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 245).isActive = true
        GoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 130).isActive = true
        
        
        SettingsButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        view.trailingAnchor.constraint(equalTo: SettingsButton.trailingAnchor, constant: 525).isActive = true
        SettingsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 75).isActive = true
        SettingsButton.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 157).isActive = true
        
        
        aboutButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 32)
        view.bottomAnchor.constraint(equalTo: aboutButton.bottomAnchor, constant: 46).isActive = true
        aboutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 267).isActive = true
        aboutButton.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 315).isActive = true
        
    }
    func iphone8(){
        Background.contentMode = .scaleToFill
        Background.image = #imageLiteral(resourceName: "iphoneXBackground")
        
        GoButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 50)
        view.bottomAnchor.constraint(equalTo: GoButton.bottomAnchor, constant: 85).isActive = true
        GoButton.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 215).isActive = true
        GoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 112).isActive = true
        
        SettingsButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        view.trailingAnchor.constraint(equalTo: SettingsButton.trailingAnchor, constant: 465).isActive = true
        SettingsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 65).isActive = true
        SettingsButton.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 139).isActive = true
        
        aboutButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        view.bottomAnchor.constraint(equalTo: aboutButton.bottomAnchor, constant: 35).isActive = true
        aboutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 239).isActive = true
        aboutButton.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 284).isActive = true
    }
    func ipadPro(){
        Background.contentMode = .scaleToFill
        GoButton.frame.size.width = 170
        GoButton.frame.size.height = 170
        GoButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 100)
        view.bottomAnchor.constraint(equalTo: GoButton.bottomAnchor, constant: 209).isActive = true
        view.trailingAnchor.constraint(equalTo: GoButton.trailingAnchor, constant: 961).isActive = true
        GoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 200).isActive = true
        
        SettingsButton.frame.size.width = 220
        SettingsButton.frame.size.height = 147
        SettingsButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 60)
        view.trailingAnchor.constraint(equalTo: SettingsButton.trailingAnchor, constant: 935).isActive = true
        SettingsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 118).isActive = true
        SettingsButton.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 420).isActive = true
        
        aboutButton.frame.size.width = 222
        aboutButton.frame.size.height = 129
        aboutButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 60)
        view.trailingAnchor.constraint(equalTo: aboutButton.trailingAnchor, constant: 667).isActive = true
        aboutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 445).isActive = true
        view.bottomAnchor.constraint(equalTo: aboutButton.bottomAnchor, constant: 94).isActive = true
    }
    func ipad10inch(){
        Background.contentMode = .scaleToFill
        GoButton.frame.size.width = 220
        GoButton.frame.size.height = 110
        GoButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 82)
        
        view.bottomAnchor.constraint(equalTo: GoButton.bottomAnchor, constant: 174).isActive = true
        view.trailingAnchor.constraint(equalTo: GoButton.trailingAnchor, constant: 810).isActive = true
        GoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 161).isActive = true
        
        SettingsButton.frame.size.width = 220
        SettingsButton.frame.size.height = 110
        SettingsButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 55)
        view.trailingAnchor.constraint(equalTo: SettingsButton.trailingAnchor, constant: 737).isActive = true
        SettingsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 92).isActive = true
        SettingsButton.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 335).isActive = true
        
        aboutButton.frame.size.width = 200
        aboutButton.frame.size.height = 108
        aboutButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 55)
        view.trailingAnchor.constraint(equalTo: aboutButton.trailingAnchor, constant: 515).isActive = true
        aboutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 338).isActive = true
        view.bottomAnchor.constraint(equalTo: aboutButton.bottomAnchor, constant: 80).isActive = true
    }
    func ipad9inch(){
        Background.contentMode = .scaleToFill
        
        GoButton.frame.size.width = 220
        GoButton.frame.size.height = 110
        GoButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 82)
        view.bottomAnchor.constraint(equalTo: GoButton.bottomAnchor, constant: 160).isActive = true
        view.trailingAnchor.constraint(equalTo: GoButton.trailingAnchor, constant: 738).isActive = true
        GoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 155).isActive = true
        
        SettingsButton.frame.size.width = 220
        SettingsButton.frame.size.height = 110
        SettingsButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 55)
        view.trailingAnchor.constraint(equalTo: SettingsButton.trailingAnchor, constant: 700).isActive = true
        SettingsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 85).isActive = true
        SettingsButton.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 305).isActive = true
        
        aboutButton.frame.size.width = 200
        aboutButton.frame.size.height = 108
        aboutButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 55)
        view.trailingAnchor.constraint(equalTo: aboutButton.trailingAnchor, constant: 495).isActive = true
        aboutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 312).isActive = true
        view.bottomAnchor.constraint(equalTo: aboutButton.bottomAnchor, constant: 65).isActive = true
    }
    
}

