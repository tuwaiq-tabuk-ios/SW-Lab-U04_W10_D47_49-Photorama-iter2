//
//  PhotoInfoViewController.swift
//  Photorama
//
//  Created by Atheer abdullah on 09/05/1443 AH.
//

import UIKit
class PhotoInfoViewController: UIViewController {
    @IBOutlet var imageVieww: UIImageView!

var photo: Photo! {
     didSet {
         navigationItem.title = photo.title
     }
}
 var store: PhotoStore!

override func viewDidLoad() {
    super.viewDidLoad()
    store.fetchImage(for: photo) { (result) -> Void in
        switch result {
        case let .success(image):
            self.imageVieww.image = image
        case let .failure(error):
            print("Error fetching image for photo: \(error)")
        }
}
  
  
}
}
