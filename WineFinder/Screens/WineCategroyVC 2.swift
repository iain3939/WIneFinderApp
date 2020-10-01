//
//  WineSelectionVC.swift
//  WineFinder
//
//  Created by iain Allen on 20/08/2020.
//

import UIKit

class WineCategroyVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var dataSet = DataSet()
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if let vc = segue.destination as? MainWineVC {
        vc.selectedWineCategory = selectedWineCategoryToPass
        
        
    }
    

    

}
    
}

    extension WineCategroyVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSet.wineCategoryArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! WineSelectionCell
        let item = dataSet.wineCategoryArray[indexPath.item]
        cell.configureCell(category: item)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "SelectedWine") as? MainWineVC {
            vc.selectedWineCategory = dataSet.wineCategoryArray[indexPath.item].name
            
            
            navigationController?.pushViewController(vc, animated: true)
            
        }
        
        


            
           
        }
        
        
        
        
    }
    
    
    
    
    
    


