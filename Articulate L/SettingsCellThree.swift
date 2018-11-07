//
//  SettingsCell3.swift
//  Articulate L
//
//  Created by Anthony Rubin on 5/16/18.
//  Copyright © 2018 Emu Speech Therapy. All rights reserved.
//

import UIKit

class SettingsCellThree: UITableViewCell {
    var switchChanged3: (Bool) -> () = { _ in   }
    
    @IBOutlet weak var wordGroupSwitch: UISwitch!
    
    @IBAction func switchValueChanged3() {
        let defaults = UserDefaults.standard
        
        defaults.set(wordGroupSwitch.isOn, forKey: "random")
        defaults.synchronize()
        
    }
}
