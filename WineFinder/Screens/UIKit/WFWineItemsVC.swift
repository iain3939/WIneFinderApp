//
//  ViewController.swift
//  WineFinder
//
//  Created by iain Allen on 16/08/2020.
//

import UIKit
import SwiftUI

class WFWineItemsVC: UIViewController {
    
    enum Section {
        case main
    }
    
    var wine: Wine!
    var wineItems: [Wine] = []
    var filteresWineItems: [Wine] = []
    var isSearching = false
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Wine>!
    
    init(wineItems: [Wine]) {
        super.init(nibName: nil, bundle: nil)
        self.wineItems = wineItems
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.orange]
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.orange]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesSearchBarWhenScrolling = false
        configureCollectionView()
        configureDataSource()
        configureSearchController()
        updateData(on: wineItems)
    }
    
    func configureSearchController() {
        let searchController = UISearchController()
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search for a wine"
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createTwoColumCompositionalLayout(in: view))
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.backgroundColor = .systemBackground
        collectionView.register(WFWineItemsCell.self, forCellWithReuseIdentifier: CellIdentifiers.wineItemsIdentifier)
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Wine>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, wine) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifiers.wineItemsIdentifier, for: indexPath) as? WFWineItemsCell
            cell?.configureCell(wineItem: wine)
            return cell
        })
    }
    
    func updateData(on wines: [Wine]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Wine>()
        snapshot.appendSections([.main])
        snapshot.appendItems(wines)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
    }
}

extension WFWineItemsVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let wine = dataSource.itemIdentifier(for: indexPath) else { return }
        
        if #available(iOS 13.0, *) {
            let wineDetailView = WFWineDetailView(wine: wine)
            let host = UIHostingController(rootView: wineDetailView)
            navigationController?.pushViewController(host, animated: true)
        }
    }
}

extension WFWineItemsVC: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let filter = searchController.searchBar.text, !filter.isEmpty else {
            filteresWineItems.removeAll()
            updateData(on: wineItems)
            isSearching = false
            return
        }
        isSearching = true
        filteresWineItems = wineItems.filter { $0.wineName.lowercased().contains(filter.lowercased()) }
        updateData(on: filteresWineItems)
    }
}


