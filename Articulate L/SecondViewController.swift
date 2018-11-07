//
//  SecondViewController.swift
//  firstapp
//
//  Created by Anthony Rubin on 6/20/17.
//  Copyright © 2017 rubin. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController , UIGestureRecognizerDelegate, isOnProtocol {

    @IBOutlet weak var flashcardLabel: UILabel!
    @IBOutlet weak var imgPhoto: UIImageView!
    
    var imageIndex: Int = 0
    var itemList:[Card] = []
   
    @IBAction func unwindsegue(_ sender: UIStoryboardSegue){
       
    }
    func addlist(list:[String])
    {
        for word in list
        {
            itemList.append(Card(image: word))
        }
    }
    override func viewWillLayoutSubviews() {
        if(UserDefaults.standard.bool(forKey: "changed")==true){
            view.bottomAnchor.constraint(equalTo: imgPhoto.bottomAnchor, constant: ((view.frame.size.height) * 0.17)).isActive = true
            flashcardLabel.topAnchor.constraint(equalTo: imgPhoto.bottomAnchor, constant: 5).isActive = true
        }else{
            flashcardLabel.isHidden = true
            view.bottomAnchor.constraint(equalTo: imgPhoto.bottomAnchor, constant: 20).isActive = true
        }
    }
    func random(){
        if(UserDefaults.standard.bool(forKey: "random")==true){
            itemList.shuffle()
        }
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        for i in 0..<12 {
            let list: [String]
            switch i {
            case 0: list = ["lake", "lamb", "lamp", "leaf", "leash", "left", "leg", "lime", "lips", "list", "lock", "log", "look", "loud", "love", "lunch"]
            case 1: list = ["ladder", "ladybug", "laughing", "lawnmower", "lemon", "lemur", "leopard", "leprechaun", "letter", "lion", "licking", "lifting", "lightbulb", "lightning", "listen", "llama"]
            case 2: list = ["balloon", "bowling", "cello", "colors", "dollar", "goalie", "hello", "holly", "hula", "olive", "pillow", "police", "ruler", "salad", "silly","tulip", "yellow"]
            case 3: list = ["alligator", "ballerina", "buffalo", "calendar", "elephant", "eyelashes", "family", "helicopter", "jellyfish", "pelican", "polar bear", "telephone", "television", "umbrella", "valentine","violin", "watermelon", "xylophone"]
            case 4: list = ["apple", "ball", "bell", "bubble", "castle", "crawl",  "fall", "girl", "nail", "owl", "pail", "peel", "pool", "seagull", "seal", "smile", "snail", "well", "whale", "wheel", "yell"]
            case 5: list = ["plane", "planet", "plant", "plate", "play", "plum", "plumber", "plus"]
            case 6: list = ["black", "blanket", "blender", "blocks", "blonde", "blood", "blow", "blue"]
            case 7: list = ["flag", "flamingo", "float", "floor", "flower", "fluffy", "flute", "fly"]
            case 8: list = ["glacier", "glad", "glasses", "glide", "glitter", "globe", "glove", "glue"]
            case 9: list = ["clap", "class", "claw", "clean", "climb", "clip", "clock", "cloud", "clown"]
            case 10: list = ["sled", "sleep", "sleeves", "slice", "slide", "slime", "slip", "slow"]
            case 11: list = ["belt", "cold", "elf", "gold", "golf", "melt", "milk", "shelf"]
            default: fatalError()
                
            }
            if UserDefaults.standard.value(forKey: "\(i)") as? Bool ?? true {
                addlist(list:list)
            }
        }
        random()
       let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imgPhoto.isUserInteractionEnabled = true
        imgPhoto.addGestureRecognizer(tapGestureRecognizer)
        
        imageDisplayed()
        
        // Do any additional setup after loading the view.
        imgPhoto.isUserInteractionEnabled = true
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(Swiped(gesture:)))
        leftSwipe.cancelsTouchesInView = false
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(Swiped(gesture:)))
        rightSwipe.cancelsTouchesInView = false
        
        leftSwipe.direction = .left
        rightSwipe.direction = .right
        
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? MemoryViewController{
            destination.returnToImage = imageIndex
        }
    }
    internal func isOn() {
        imgPhoto.isUserInteractionEnabled = true
       
    }
    
    func Swiped(gesture: UIGestureRecognizer) {
        imgPhoto.isUserInteractionEnabled = true
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
                
            case UISwipeGestureRecognizerDirection.right :
                
                // decrease index first
                
                imageIndex -= 1
                
                // check if index is in range
                
                if imageIndex < 0 {
                    
                    imageIndex = itemList.count - 1
                    
                }
                UIImageView.transition(with: imgPhoto, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
               
               
                let imagePath = Bundle.main.path(forResource: itemList[imageIndex].image, ofType: "png" )
                imgPhoto.image = UIImage(contentsOfFile: imagePath!)
                
                flashcardLabel.text = itemList[imageIndex].image
               
            case UISwipeGestureRecognizerDirection.left:
                
                // increase index first
                
                imageIndex += 1
                
                // check if index is in range
                
                if imageIndex > itemList.count - 1 {
                    
                    imageIndex = 0
                    
                }
                UIImageView.transition(with: imgPhoto, duration: 0.3, options: .transitionFlipFromRight, animations: nil, completion: nil)
                let imagePath = Bundle.main.path(forResource: itemList[imageIndex].image, ofType: "png")
                imgPhoto.image = UIImage(contentsOfFile: imagePath!)
              
                
                flashcardLabel.text = itemList[imageIndex].image
            default:
                break //stops the code/codes nothing.
            }
        }
    }
   
    func imageDisplayed(){
        let imagePath = Bundle.main.path(forResource: itemList[imageIndex].image, ofType: "png")
        imgPhoto.image = UIImage(contentsOfFile: imagePath!)
        flashcardLabel.text = itemList[imageIndex].image
    }
    func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        imgPhoto.isUserInteractionEnabled = false
        let card = itemList[imageIndex]
        card.delegate = self
        card.playSound()
    }

}
