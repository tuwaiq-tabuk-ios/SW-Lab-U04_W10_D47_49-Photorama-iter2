//
//  PhotoDataSource.swift
//  Photorama_"Bushra_Nazal"
//
//  Created by bushra nazal alatwi on 09/05/1443 AH.
//

import UIKit

class PhotoDataSource: NSObject {
  
  
  var photos = [Photo]()
}


extension PhotoDataSource: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return photos.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let identifier = "PhotoCollectionViewCell"
    let cell =
    collectionView.dequeueReusableCell(withReuseIdentifier: identifier,
                                       for: indexPath) as! PhotoCollectionViewCell
    cell.update(displaying: nil)
    return cell
    
  }
}

