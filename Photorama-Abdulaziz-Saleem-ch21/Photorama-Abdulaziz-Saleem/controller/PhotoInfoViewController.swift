//
//  PhotoInfoViewController.swift
//  Photorama-Abdulaziz-Saleem
//
//  Created by عبدالعزيز البلوي on 09/05/1443 AH.
//

import UIKit

class PhotoInfoViewController: UIViewController {

  @IBOutlet var imageView: UIImageView!
  
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
                  self.imageView.image = image
              case let .failure(error):
                  print("Error fetching image for photo: \(error)")
              }
      }
        // Do any additional setup after loading the view.
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
