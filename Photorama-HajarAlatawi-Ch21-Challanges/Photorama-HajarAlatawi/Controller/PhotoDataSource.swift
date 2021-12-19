//
//  PhotoDataSource.swift
//  Photorama-HajarAlatawi
//
//  Created by HAJAR on 12/12/2021.
//

import UIKit

class PhotoDataSource: NSObject,
                       UICollectionViewDataSource {
  
  var photos = [Photo]()
  
  func collectionView(_ collectionView: UICollectionView,
                      numberOfItemsInSection section: Int)
  -> Int {
    
    return photos.count
  }
  
  
  func collectionView(_ collectionView: UICollectionView,
                      cellForItemAt indexPath: IndexPath)
  -> UICollectionViewCell {
    
    let identifier = "PhotoCollectionViewCell"
    let cell =
    collectionView.dequeueReusableCell(withReuseIdentifier: identifier,
                                       for: indexPath) as! PhotoCollectionViewCell
    cell.update(displaying: nil)
    
    return cell
    
  }
}
