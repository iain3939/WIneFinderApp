//
//  ViewController.swift
//  WineFinder
//
//  Created by iain Allen on 16/08/2020.
//

import UIKit
import SwiftUI

class WFMainWineVC: UIViewController, UICollectionViewDelegate {
    
    enum Section {
        case main
    }
    
    @IBOutlet  var collectionView: UICollectionView!
    
    typealias DataSource            = UICollectionViewDiffableDataSource<Section, Wine>
    typealias Snapshot              = NSDiffableDataSourceSnapshot<Section, Wine>
    private lazy var dataSource     = makeDataSource()
    private var searchController    = UISearchController(searchResultsController: nil)
    
    var dataSet = DataSet()
    var wines : [Wine] = []
    var wineCategory :  WineCategorys!
    var selectedWineCategory: String!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.hidesSearchBarWhenScrolling = false
        collectionView.delegate = self
        configureSearchController()
        applySnapshot(animatingDifferences: false)
        configureCollectionView()
    }
    
    
    func configureCollectionView() {
        collectionView.collectionViewLayout = generateLayout()
    }
    
    
    func generateLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0))
        
        let fullPhotoItem = NSCollectionLayoutItem(layoutSize: itemSize)
        fullPhotoItem .contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(2/3))
        
        let group      = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: fullPhotoItem, count: 2)
        let section    = NSCollectionLayoutSection(group: group)
        let layout     = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
    
    
    func makeDataSource() -> DataSource {
        dataSource = UICollectionViewDiffableDataSource<Section, Wine>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, wine) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? WineCell
            cell?.configureCell(wine: wine)
            return cell
        })
        return dataSource
    }
    
    
    func applySnapshot(animatingDifferences: Bool = true) {
        var snapshot = Snapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(wines)
        dataSource.apply(snapshot, animatingDifferences: animatingDifferences)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let wine = dataSource.itemIdentifier(for: indexPath) else { return }
        if #available(iOS 13.0, *) {
            let wineDetailView = WFWineDetailView(wine: wine)
            
            let host = UIHostingController(rootView: wineDetailView)
            navigationController?.pushViewController(host, animated: true)
        }
    }
    
}

extension WFMainWineVC: UISearchResultsUpdating, UISearchBarDelegate {
    
    func  filteredWines(for queryOrNil: String?) -> [Wine] {
        let  wines = dataSet.getWineSets(forCategoryName: selectedWineCategory)
        guard let querry = queryOrNil, !querry.isEmpty else { return wines }
        return wines.filter {
            
            return $0.wineName.lowercased().contains(querry.lowercased())
        }
    }
    
    
    func updateSearchResults(for searchController: UISearchController) {
        // Work in progress the wine items are only showing up when the search field is tapped.
        // As wines array could be empty.
        wines = filteredWines(for: searchController.searchBar.text)
        applySnapshot()
    }
    
    
    func configureSearchController() {
        searchController.searchResultsUpdater                   = self
        searchController.searchBar.placeholder                  = "Search for a wine"
        searchController.obscuresBackgroundDuringPresentation   = false
        navigationItem.searchController                         = searchController
        definesPresentationContext                              = true
    }
}




