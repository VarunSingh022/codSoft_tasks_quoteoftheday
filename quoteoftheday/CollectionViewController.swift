//
//  CollectionViewController.swift
//  quoteoftheday
//
//  Created by Varun Kumar Singh on 17/07/24.
//

import UIKit

class CollectionViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    let reuseIdentifier = "cell"
    var favouritePhotos: [UIImage] = []
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()

        }

}
extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favouritePhotos.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 5
        
        cell.imageViews.image = favouritePhotos[indexPath.item]
        cell.delegate = self
        

            return cell
        
        
        }
    
    func collectionView(_ collectionView:UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.size.width-10)/2
        return CGSize(width: size, height: size)
    }
    
    
}
extension CollectionViewController : CollectionViewCellDelegate{
    func delete(cell: CollectionViewCell) {
        if let indexPath = collectionView?.indexPath(for: cell){
            favouritePhotos.remove(at: indexPath.item)
            
            collectionView?.deleteItems(at: [indexPath])
        }
    }
    
    
}
