//
//  ViewController.swift
//  Sample-GeneralInfo
//
//  Created by Ronaldo Gomes on 8/2/18.
//  Copyright © 2018 Technophile. All rights reserved.
//

import UIKit

class ViewController: GeneralnfoViewController, GeneralInfoBodyViewDelegate {

    let orangeBuilder: GeneralInfoBodyView = GeneralInfoBodyView(color: .orange, text: "Orange")
    let greenBuilder: GeneralInfoBodyView = GeneralInfoBodyView(color: .green, text: "Green")
    
    override func loadBuilders() -> [GeneralInfoViewBuilder] {
        var builders = [GeneralInfoViewBuilder]()
        builders.append(GeneralInfoTitleView(title: "This is the Title"))
        
        orangeBuilder.delegate = self
        builders.append(orangeBuilder)
        
        builders.append(GeneralInfoBodyView(color: .purple, text: "Purple"))
        
        greenBuilder.delegate = self
        builders.append(greenBuilder)        
        
        return builders
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func execute(_ builder: GeneralInfoBodyView) {
        
        var text: String = ""        
        if builder === self.greenBuilder {
            text = "Green Builder"
        } else if builder === self.orangeBuilder {
            text = "Orange Builder"
        } else {
            text = "a label"
        }
        
        let alertVC = UIAlertController(title: "Label Action", message: "I happened after \(text) has been tapped", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertVC.addAction(okButton)
        self.present(alertVC, animated: true, completion: nil)
    }
    
}
