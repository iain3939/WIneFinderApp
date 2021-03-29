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
    
    var mockdata = WineCategories.jsonMockData
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, WineCategories>!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
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
        collectionView.register(WFCategoryCell.self, forCellWithReuseIdentifier: CellIdentifiers.wineCategoryIdentifier)
        collectionView.register(WFWineCategoryHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: WFWineCategoryHeaderView.identifier)
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, WineCategories>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, category) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifiers.wineCategoryIdentifier, for: indexPath) as? WFCategoryCell
            cell?.configureCell(category: category)
            
            return cell
        })
        
        dataSource.supplementaryViewProvider = { collectionView, kind, indexPath in
            guard  kind == UICollectionView.elementKindSectionHeader else { return nil }
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: WFWineCategoryHeaderView.identifier, for: indexPath) as? WFWineCategoryHeaderView
            view?.titleLabel.text = "Home"
            return view
        }
    }
    
    func updateData(on categories: [WineCategories]) {
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
        let vc = WFWineItemsVC(wineItems: category.wineCategories)
        vc.title = category.categoryName
        navigationController?.navigationBar.tintColor = .orange
        navigationController?.pushViewController(vc, animated: true)
    }
}
