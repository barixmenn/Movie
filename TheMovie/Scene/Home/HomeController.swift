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
    let viewModel = HomeViewModel()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
    }
    
    //MARK: - Functions
    
    fileprivate func configure() {
        viewModelConfiguration()
        collectionSetup()

    }
    
    //MARK: - Actions

}

//MARK: - Get Data
extension HomeController {
    fileprivate func viewModelConfiguration() {
        viewModel.getCategoryItems()
        viewModel.errorCallback = { [weak self] errorMessage in
          print("Error:\(errorMessage)")
        }
        
        viewModel.successCallback = { [weak self] in
            DispatchQueue.main.async {
                self?.collection.reloadData()
            }
        }
    }
}


//MARK: - CollectionView Extensions
extension HomeController {
    fileprivate func collectionSetup() {
        collection.register(UINib(nibName: "\(HorizontalViewCell.self)", bundle: nil), forCellWithReuseIdentifier: "cell")
    }
}


extension HomeController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.movie?.results?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HorizontalViewCell
        if let movie = viewModel.movie?.results?[indexPath.item] {
            cell.configure(data: movie)
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 120)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 130)

    }
    
}
