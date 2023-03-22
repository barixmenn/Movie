//
//  SearchController.swift
//  TheMovie
//
//  Created by Baris on 18.03.2023.
//

import UIKit

final class PeopleController : UIViewController {
    
    //MARK: - UI Elements
    @IBOutlet weak var collection: UICollectionView!
    
    //MARK: - Properties
    let viewModel = PeopleViewModel()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
    }
    
    //MARK: - Functions
    fileprivate func configure() {
        //setupCollection()
        getData()
        
    }
    
    //MARK: - Actions
    
    
}

//MARK: - GET Data
extension PeopleController {
    
    func getData() {
        viewModel.getPopularPeople()
        viewModel.errorCallback = { [weak self] errorMessage in
            print(errorMessage)
        }
        viewModel.successCallback = { [weak self]   in
            self?.collection.reloadData()
        }
        viewModel.coordinator = PeopleCoordinator(navigationController: navigationController ?? UINavigationController())
        
    }
}


//MARK: - Collection Extensions


extension PeopleController : UICollectionViewDelegate, UICollectionViewDataSource,  UICollectionViewDelegateFlowLayout {
    
    fileprivate func setupCollection() {
        collection.register(UINib(nibName: "\(PeopleCell.self)", bundle: nil), forCellWithReuseIdentifier: "cell")
    }
    
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.peopleItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PeopleCell
        
        cell.configure(data: viewModel.peopleItems[indexPath.item])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 2 - 10
        let height = collectionView.frame.height * 270 / 800
        return CGSize(width: width, height: height)
        
        
        
    }
}

