//
//  ViewController.swift
//  TheLight
//
//  Created by Nikita Semennikov on 14.12.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var isLightOn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    fileprivate func updateUI() {
        view.backgroundColor = isLightOn ? .white : .black
    }
    
    @IBAction func buttonPressed() {
        isLightOn.toggle()
        updateUI()
    }
    
}
