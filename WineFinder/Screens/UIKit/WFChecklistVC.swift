//
//  WFChecklistVC.swift
//  WineFinderApp
//
//  Created by iain Allen on 27/01/2021.
//

import UIKit

class WFChecklistVC: UIViewController {
    
    let tableView = UITableView()
    var favorites: [Wine] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getFavorites()
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.rowHeight = 80
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.orange]
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.orange]
        
        tableView.register(ChecklistCell.self, forCellReuseIdentifier: ChecklistCell.resuseID)
    }
    

    func getFavorites() {
        PersistenceManager.retrieveFavorites { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let favorites):
                if favorites.isEmpty {
                    print("No Items")
                } else {
                    self.favorites = favorites
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        self.view.bringSubviewToFront(self.tableView)
                    }
                }
               
            case .failure(let error):
                print(error.rawValue)
            }
        }
    }

}

extension WFChecklistVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChecklistCell.resuseID, for: indexPath) as! ChecklistCell
        let favorite = favorites[indexPath.row]
        cell.configureCell(favorites: favorite)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        
        let favorite = favorites[indexPath.row]
        favorites.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .left)
        
        PersistenceManager.update(favorite: favorite, actionType: .remove) {  error in
//            guard let self = self else { return }
            
            guard let error = error else { return}
            
            print(error.rawValue)
            
        }
    }
    
    
}
