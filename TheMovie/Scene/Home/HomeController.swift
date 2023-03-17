//
//  HomeViewController.swift
//  TheMovie
//
//  Created by Baris on 18.03.2023.
//

import UIKit

final class HomeController : UIViewController {
    
    //MARK: - UI Elements
    @IBOutlet weak var collection: UICollectionView!
    //MARK: - Properties
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionSetup()
        
    }
    
    //MARK: - Functions
    
    //MARK: - Actions

}

extension HomeController {
    fileprivate func collectionSetup() {
        collection.register(UINib(nibName: "\(HorizontalViewCell.self)", bundle: nil), forCellWithReuseIdentifier: "cell")
    }
}


extension HomeController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 120)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 130)

    }
    
}
