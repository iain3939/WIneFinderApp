//
//  WFWineCategroyVC.swift
//  WineFinderApp
//
//  Created by iain Allen on 20/01/2021.
//

import UIKit

class WFWineCategroyVC: UIViewController {
    
    enum Section {
        case main
    }
    
    var mockdata = WineCategories
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, WineCategories>!
    var naviationController: UINavigationController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureDataSource()
        updateData(on: mockdata)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createOneColumCompositionalLayout(in: view))
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.backgroundColor = .systemBackground
        collectionView.register(WFCategoryCell.self, forCellWithReuseIdentifier: CellIdentifiers.wineCategoriesIdentifire)
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, WineCategories>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, category) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifiers.wineCategoriesIdentifire, for: indexPath) as? WFCategoryCell
            cell?.configureCell(category: category)
            return cell
        })
    }
    
    func updateData(on categorys: [WineCategories]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, WineCategories>()
        snapshot.appendSections([.main])
        snapshot.appendItems(mockdata)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
    }
}

extension WFWineCategroyVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let category = mockdata[indexPath.row]
        
        let vc = WFWineItemsVC(wineItems: category.WineCategories)
        vc.title = category.categoryName
        navigationController?.pushViewController(vc, animated: true)
    }
}
