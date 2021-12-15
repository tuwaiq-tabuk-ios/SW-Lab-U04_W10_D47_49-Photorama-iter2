//
//  PhotoCollectionViewCell.swift
//  Photorama-Areej_Alanze
//
//  Created by A A on 13/12/2021.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var spinner: UIActivityIndicatorView!
  
  func update(displaying image: UIImage?) {
    if let imageToDisplay = image {
      spinner.stopAnimating()
      imageView.image = imageToDisplay
    } else {
      spinner.startAnimating()
      imageView.image = nil
    }
  }

}
