//
//  CollectionViewCell.swift
//  quoteoftheday
//
//  Created by Varun Kumar Singh on 17/07/24.
//

import UIKit

protocol CollectionViewCellDelegate: class{
    func delete(cell: CollectionViewCell)
}

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageViews: UIImageView!
    weak var delegate: CollectionViewCellDelegate?
    @IBAction func deleteButtonDidTap(_ sender: Any) {
        delegate?.delete(cell: self)
    }
    
}
    

