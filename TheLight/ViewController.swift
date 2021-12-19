//
//  ViewController.swift
//  TheLight
//
//  Created by Nikita Semennikov on 14.12.2021.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var flash = true
    
    @IBAction func buttonPressed (_ sender: Any) {
        flash = !flash
        updateView()
    }

    func updateView() {
        let device = AVCaptureDevice.default(for: AVMediaType.video)
        
        if let dev = device, dev.hasTorch {
            view.backgroundColor = .black
            do {
                try dev.lockForConfiguration()
                dev.torchMode = flash ? .on : .off
                dev.unlockForConfiguration()
            } catch {
                print(error)
            }
        } else {
            view.backgroundColor = flash ? .white : .black
        }
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
}
}
