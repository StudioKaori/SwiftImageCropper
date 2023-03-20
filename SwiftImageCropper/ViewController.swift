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

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, CropViewControllerDelegate {
  
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
    picker.delegate = self
    present(picker, animated: true)
  }
  
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true)
  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    guard let image = info[.originalImage] as? UIImage else {
      return
    }
    picker.dismiss(animated: true)
    
    showCrop(image: image)
  }
  
  func showCrop(image: UIImage) {
    // cropper
    let vc = CropViewController(croppingStyle: .default, image: image)
    
    // cropper option, the cropper works withiout following
    // default aspect ration
    vc.aspectRatioPreset = .presetSquare
    // You can lock the aspect ratio
    vc.aspectRatioLockEnabled = true
    vc.toolbarPosition = .bottom
    vc.doneButtonTitle = "Continue"
    vc.cancelButtonTitle = "Quit"
    
    // show the vc
    present(vc, animated: true)
  }
  
  // CropViewControllerDelegate -> When the cancel button is pressed
  func cropViewController(_ cropViewController: CropViewController, didFinishCancelled cancelled: Bool) {
    cropViewController.dismiss(animated: true)
  }
  
  func cropViewController(_ cropViewController: CropViewController, didCropToImage image: UIImage, withRect cropRect: CGRect, angle: Int) {
    print("did crop")
  }
}

