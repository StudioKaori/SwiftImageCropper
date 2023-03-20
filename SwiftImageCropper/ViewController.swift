//
//  ViewController.swift
//  SwiftImageCropper
//
//  Created by Kaori Persson on 2023-03-20.
//

//#Image cropper by TOCropViewController
//
//Video
//https://www.youtube.com/watch?v=XPcuAg0Xctw
//
//Repo
//https://github.com/TimOliver/TOCropViewController

import CropViewController
import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
    button.setTitle("Pick Photo", for: .normal)
    view.addSubview(button)
    button.center = view.center
    button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
  }

  @objc func didTapButton() {
    let picker = UIImagePickerController()
    picker.sourceType = .photoLibrary
    present(picker, animated: true)
  }

}

