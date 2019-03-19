//
//  SettingsViewController.swift
//  Notificacoes
//
//  Created by Usuário Convidado on 18/03/19.
//  Copyright © 2019 Usuário Convidado. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var swSounds: UISwitch!
    @IBOutlet weak var scColors: UISegmentedControl!
    @IBOutlet weak var tfName: UITextField!
    
    var ud = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        swSounds.isOn = ud.bool(forKey: "sound")
        scColors.selectedSegmentIndex = ud.integer(forKey: "color")
        tfName.text = ud.string(forKey: "name")
        
    }
    
    @IBAction func changeSound(_ sender: UISwitch) {
        ud.set(sender.isOn, forKey: "sound")
        ud.synchronize()
    }
    
    @IBAction func changeColor(_ sender: UISegmentedControl) {
        ud.set(sender.selectedSegmentIndex, forKey: "color")
        ud.synchronize()
    }
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SettingsViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        ud.set(textField.text, forKey: "name")
        ud.synchronize()
        view.endEditing(true)
        return true
    }
    
}
