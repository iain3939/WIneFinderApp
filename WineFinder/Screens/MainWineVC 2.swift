//
//  ViewController.swift
//  WineFinder
//
//  Created by iain Allen on 16/08/2020.
//

import UIKit

class MainWineVC: UIViewController, UICollectionViewDelegate {
    
    enum Section {
        case main
    }
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Wine>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Wine>
    private lazy var dataSource  = makeDataSource()
    private var searchController = UISearchController(searchResultsController: nil)
    
    @IBOutlet  var collectionView: UICollectionView!
    
    
    var dataSet = DataSet()
    var wines : [Wine] = []
    var filteredWines : [Wine] = []
    var isSearching = false
    var wineCategory :  WineCategorys!
    var selectedWineCategory: String!
    
    var columns: CGFloat = 2
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
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
      let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: fullPhotoItem, count: 2)

      let section = NSCollectionLayoutSection(group: group)

      let layout = UICollectionViewCompositionalLayout(section: section)
      return layout
    }
    
    
    
    
    
// MARK: - newData Source
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
    
    

    if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? WineDetailVC {
            vc.selectedImage = wines[indexPath.item]
            navigationController?.pushViewController(vc, animated: true)
    
    }
}
}



extension MainWineVC: UISearchResultsUpdating, UISearchBarDelegate {

    func updateSearchResults(for searchController: UISearchController) {
        wines = filteredWines(for: searchController.searchBar.text)
        applySnapshot()
        
    }
    
    func  filteredWines(for queryOrNil: String?) -> [Wine] {
        filteredWines = dataSet.getWineSets(forCategoryName: selectedWineCategory)
        guard let querry = queryOrNil, !querry.isEmpty else { return filteredWines}
        return filteredWines.filter {
            
            return $0.wineName.lowercased().contains(querry.lowercased())
            
            
            
            
        }
        
    }
    
    func configureSearchController() {
        
        
        searchController.searchResultsUpdater = self
       searchController.searchBar.placeholder = "Search for a wine"
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        applySnapshot(animatingDifferences: false)
    }
}
extension MainWineVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = Int(collectionView.frame.width / columns)
        return  CGSize(width: width, height: width)
    }
}



