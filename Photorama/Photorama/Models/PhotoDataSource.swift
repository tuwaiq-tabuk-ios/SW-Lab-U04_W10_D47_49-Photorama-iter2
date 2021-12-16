//
//  PhotoDataSource.swift
//  Photorama
//
//  Created by arwa balawi on 10/05/1443 AH.
//

import UIKit
class PhotoDataSource: NSObject, UICollectionViewDataSource {
    var photos = [Photo]()
  
  
  func collectionView(_ collectionView: UICollectionView,
                          numberOfItemsInSection section: Int) -> Int {
          return photos.count
  }
      func collectionView(_ collectionView: UICollectionView,
                          cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          let identifier = "PhotoCollectionViewCell"
          let cell =
              collectionView.dequeueReusableCell(withReuseIdentifier: identifier,
                                                 for: indexPath)
  return cell }
  
  
  
}
