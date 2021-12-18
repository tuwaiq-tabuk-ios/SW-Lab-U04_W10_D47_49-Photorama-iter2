//
//  ViewController.swift
//  Photorama
//
//  Created by Shorouq AlAnzi on 08/05/1443 AH.
//

import UIKit

class PhotosViewController: UIViewController , UICollectionViewDelegate {
  
  @IBOutlet var collectionView: UICollectionView!
  
  var store : PhotoStore!
  let photoDataSource = PhotoDataSource()
  let sectionInsets = UIEdgeInsets(top: 2.0, left: 2.0, bottom: 2.0, right: 2.0)
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    collectionView.dataSource = photoDataSource
    collectionView.delegate = self
    
    
    store.fetchInterestingPhotos {
      (photosResult) in
      
      switch photosResult {
      case let .success(photos):
        print("Successfully found \(photos.count) photos.")
        self.photoDataSource.photos = photos
        
      case let .failure(error):
        print("Error fetching interesting photos: \(error)")
        self.photoDataSource.photos.removeAll()
      }
      self.collectionView.reloadSections(IndexSet(integer: 0))
    }
    
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      willDisplay cell: UICollectionViewCell,
                      forItemAt indexPath: IndexPath)
  {
    let photo = photoDataSource.photos[indexPath.row]
    // Download the image data, which could take some time
    store.fetchImage(for: photo)
    {
      (result)  in
      // The index path for the photo might have changed between the
      // time the request started and finished, so find the most
      // recent index path
      guard let photoIndex = self.photoDataSource.photos.firstIndex(of: photo),
            case let .success(image) = result else {
              return
            }
      
      let photoIndexPath = IndexPath(item: photoIndex, section: 0)
      // When the request finishes, find the current cell for this photo
      
      if let cell = self.collectionView.cellForItem(at: photoIndexPath) as? PhotoCollectionViewCell {
        cell.update(displaying: image)
      }
    }
    
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    switch segue.identifier {
    case "showPhoto"?:
      if let selectedIndexPath =
          
          collectionView.indexPathsForSelectedItems?.first {
        
        let photo = photoDataSource.photos[selectedIndexPath.row]
        
        let destinationVC = segue.destination as! PhotoInfoViewController
        destinationVC.photo = photo
        destinationVC.store = store
      }
    default:
      preconditionFailure("Unexpected segue identifier.")
    }
  }
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow: CGFloat = 4
        
// We calculate paddingSpace. This is possible, because space is the same.
// We select one of the spaces, right or left

        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem)
    }

   // This will reset the sectioninsets.

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
}
