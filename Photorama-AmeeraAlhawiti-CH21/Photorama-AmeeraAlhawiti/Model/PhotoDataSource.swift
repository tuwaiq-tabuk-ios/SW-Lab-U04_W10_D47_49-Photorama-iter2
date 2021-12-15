//
//  PhotoDataSource.swift
//  Photorama-AmeeraAlhawiti
//
//  Created by Ameera BA on 14/12/2021.
//

import UIKit


class PhotoDataSource: NSObject, UICollectionViewDataSource {
  var photos = [Photo]()
  
  func collectionView(_ collectionView: UICollectionView,
                      numberOfItemsInSection section: Int
  ) -> Int {
    return photos.count
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
    let identifier = "PhotoCollectionViewCell"
    let cell =
    collectionView.dequeueReusableCell(withReuseIdentifier: identifier,
                                       for: indexPath) as! PhotoCollectionViewCell
    cell.update(displaying: nil)
    print("~~ ddddd")
    return cell
    
  }
}
