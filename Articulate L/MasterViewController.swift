//
//  MasterViewController.swift
//  firstapp
//
//  Created by Anthony Rubin on 7/18/17.
//  Copyright © 2017 rubin. All rights reserved.
//

import UIKit

protocol WordSelectionDelegate: class {
    func wordSelected(newWord: Word)
}

class MasterViewController: UITableViewController{
    var words = [Word]()
    
   
    weak var delegate: WordSelectionDelegate?
    
    
    @IBAction func homeButtonTapped(_ sender: Any) {
        dismiss(animated: true) { _ in }
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
   
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        self.words.append(Word(name: "initial /l/ 1 syllable", words: ["lake", "lamb", "lamp", "leaf", "leash", "left", "leg", "lime", "lips", "list", "lock", "log", "look", "loud", "love", "lunch"]))
        
        self.words.append(Word(name: "initial /l/ multisyllabic", words: ["ladder", "ladybug", "laughing", "lawnmower", "lemon", "lemur", "leopard", "leprechaun", "letter", "lion", "licking", "lifting", "lightbulb", "lightning", "listen", "llama"]))
        
        self.words.append(Word(name: "intersyllabic /l/ 2 syllables", words: ["balloon", "bowling", "cello", "colors", "dollar", "goalie", "hello", "holly", "hula", "olive", "pillow", "police", "ruler", "salad", "silly","tulip", "yellow"]))
        
        self.words.append(Word(name: "intersyllabic /l/ 3+ syllables", words: ["alligator", "ballerina", "buffalo", "calendar", "elephant", "eyelashes", "family", "helicopter", "jellyfish", "pelican", "polar bear", "telephone", "television", "umbrella", "valentine","violin", "watermelon", "xylophone"]))
        
        self.words.append(Word(name: "final /l/", words: ["apple", "ball", "bell", "bubble", "castle", "crawl",  "fall", "girl", "nail", "owl", "pail", "peel", "pool", "seagull", "seal", "smile", "snail", "well", "whale", "wheel", "yell"]))
        
        self.words.append(Word(name: "initial /pl/", words: ["plane", "planet", "plant", "plate", "play", "plum", "plumber", "plus"]))
        
        self.words.append(Word(name: "initial /bl/", words: ["black", "blanket", "blender", "blocks", "blonde", "blood", "blow", "blue"]))
        
        self.words.append(Word(name: "initial /fl/", words: ["flag", "flamingo", "float", "floor", "flower", "fluffy", "flute", "fly"]))
        
        self.words.append(Word(name: "initial /gl/", words: ["glacier", "glad", "glasses", "glide", "glitter", "globe", "glove", "glue"]))
        
        self.words.append(Word(name: "initial /kl/", words: ["clap", "class", "claw", "clean", "climb", "clip", "clock", "cloud", "clown"]))
        
        self.words.append(Word(name: "initial /sl/", words: ["sled", "sleep", "sleeves", "slice", "slide", "slime", "slip", "slow"]))
        
        self.words.append(Word(name: "final /l/ clusters", words: ["belt", "cold", "elf", "gold", "golf", "melt", "milk", "shelf"]))
 
       
       

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if(section == 0){
        return 1
        }
        if(section == 1){
            return 1
        }
        else{
            return self.words.count
        }
        }
  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        if(indexPath.section == 0){
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! SettingsCellTwo
            if let set = UserDefaults.standard.bool(forKey: "changed") as? Bool{
                cell2.wordGroupSwitch.setOn(set, animated: false)

            } else{
                cell2.wordGroupSwitch.isOn = true
            }
            cell2.selectionStyle = UITableViewCellSelectionStyle.none
            cell2.textLabel?.text = "flashcard text"
            cell2.textLabel?.textColor = UIColor.red
            cell2.textLabel?.backgroundColor = UIColor.clear
            return cell2
            }
        if(indexPath.section == 1){
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as! SettingsCellThree
            if let set = UserDefaults.standard.bool(forKey: "random") as? Bool{
                cell2.wordGroupSwitch.setOn(set, animated: false)
                
            } else{
                cell2.wordGroupSwitch.isOn = true
            }
            cell2.selectionStyle = UITableViewCellSelectionStyle.none
            cell2.textLabel?.text = "randomize flashcards"
            cell2.textLabel?.textColor = UIColor.red
            cell2.textLabel?.backgroundColor = UIColor.clear
            return cell2
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SettingsCell
            let word = self.words[indexPath.row]
            cell.wordGroupSwitch.isOn = isSwitchOn(at: indexPath.row)
            cell.textLabel?.text = word.name
            cell.textLabel?.backgroundColor = UIColor.clear
            cell.switchChanged = { [weak self] isOn in
                self?.wordGroup(at: indexPath.row , changedTo: isOn)
            }
            return cell
           
        }
    }
    
    
    
    func wordGroup(at index: Int, changedTo value: Bool) {
        let numberOfGroupsTurnedOn = Array(0..<12).map {
            isSwitchOn(at: $0)
            }.filter { $0 }.count
       
        if  (numberOfGroupsTurnedOn <= 1 && value == false) {
            //display a message
            
            let alertController = UIAlertController(title: "Error", message: "You cant turn off all wordgroups", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Dismiss", style: .cancel) { [weak self]  _ in
                self?.tableView.reloadData()
            }
            alertController.addAction(cancelAction)
            present(alertController, animated: true) { _ in }
            
        } else {
            // persist the setting
            UserDefaults.standard.set(value, forKey: "\(index)")
            UserDefaults.standard.synchronize()
        }
        
    }
    
    func isSwitchOn(at index: Int) -> Bool {
       return UserDefaults.standard.value(forKey: "\(index)") as? Bool ?? true
    }
   

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "Detail" {
            let hubso = storyboard?.instantiateViewController(withIdentifier: "secondTableVIew")
            if(hubso?.viewIfLoaded?.window == nil){
                return false
            }
           }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
        if segue.identifier == "toDetail"{
        
                let backItem = UIBarButtonItem()
                backItem.title = "Back"
                navigationItem.backBarButtonItem = backItem // This will show in the next view controller being pushed
            
            var DetailViewController: Detail!
            // with help of adaptive segue we can support all devices
            if let NavigationController = segue.destination as? UINavigationController {
                // works on devices where UISplitViewController is implemented
                DetailViewController = NavigationController.topViewController as! Detail
            } else {
                // works for iPhone on ios7, where UISplitViewController is not implemented
                DetailViewController = segue.destination as! Detail
            }
            // this is common part, where one can configure detail view
            // segue provides a new instance of detail view everytime
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let selectedwords = self.words[indexPath.row]
                let selectedname = selectedwords.name
               DetailViewController.title = "Words contained in \(selectedname)"
                DetailViewController.wordSelected(newWord: selectedwords)
            }
        }
    }
}

