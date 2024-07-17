//
//  ViewController.swift
//  quoteoftheday
//
//  Created by Varun Kumar Singh on 17/07/24.
//

import UIKit
import Social
import SwiftUI

class ViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Today's Quote", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    let colors : [UIColor] = [
        .systemRed,
        .systemBlue,
        .systemGreen,
        .systemOrange,
        .systemPink,
        .systemYellow,
        .systemTeal,
        .systemCyan,
        .systemBrown,
        .systemPurple,
        .systemGray
    
    
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPurple
        
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0,
                                 y: 0,
                                 width: 300,
                                 height: 300)
        
        imageView.center = view.center
        
        view.addSubview(button)
        
        getRandomQuote()
        button.addTarget(self, action: #selector(didTapButton),for: .touchUpInside)
        
        
    }
    
    @objc func didTapButton() {
        getRandomQuote()
        
        view.backgroundColor = colors.randomElement()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        button.frame = CGRect(x: 30,
                              y: view.frame.size.height-200-view.safeAreaInsets.bottom,
                              width: view.frame.size.width-60,
                              height: 55)
    }
    
    func getRandomQuote(){
        let urlString = "https://zenquotes.io/api/image"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else{
            return
        }
        imageView.image = UIImage(data:data)
    }
    
    var favouritePhotos: [UIImage] = []
    @IBAction func addToFavorites(_ sender: UIButton){
        if let currentPhoto = imageView.image{
            favouritePhotos.append(currentPhoto)
        }
    }
    @IBAction func showFavourites(_ sender : UIButton) {
    }
        override func prepare(for seque: UIStoryboardSegue, sender: Any?) {
            
            if seque.identifier == "openFavourites" {
                if let destination = seque.destination as? CollectionViewController {
                    destination.favouritePhotos = favouritePhotos
                }
            }
    }
        @IBAction func sharePressed(_ sender: Any) {
            let activityVC = UIActivityViewController(activityItems: [self.imageView.image as Any], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.view
            self.present (activityVC, animated: true, completion: nil)
        }
        

    
    }




