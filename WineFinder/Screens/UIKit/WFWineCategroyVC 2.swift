//
//  WineSelectionVC.swift
//  WineFinder
//
//  Created by iain Allen on 20/08/2020.
//

import UIKit

class WFWineCategroyVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let height = 280
    let columns: CGFloat = 1.0
    let insets: CGFloat = 20.0
    let spacing: CGFloat = 10.0
    let lineSpacing: CGFloat = 20.0
    
    var mockData = WineCategorys.jsonMockData
    var selectedWineCategoryToPass: String! 
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension WFWineCategroyVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mockData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifiers.wineCategoryCell, for: indexPath) as! WFCategoryCell
        let item = mockData[indexPath.item]
        cell.configureCell(category: item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let category = mockData[indexPath.row]
        let vc = WineListVC(wineItems: category.wineCategorys)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Flow Layout Delegates
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = Int((collectionView.frame.width / columns) - (insets + spacing))
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: insets, left: insets, bottom: insets, right: insets)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
}








