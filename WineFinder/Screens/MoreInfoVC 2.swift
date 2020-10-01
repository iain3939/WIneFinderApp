//
//  MoreInfoVC.swift
//  WineFinder
//
//  Created by iain Allen on 27/08/2020.
//

import UIKit

class MoreInfoVC: UIViewController {
    
    @IBOutlet weak var card1: UIView!
    @IBOutlet weak var card2: UIView!
    @IBOutlet weak var productName: UILabel!
    
    var selectedWine : Wine!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGroupedBackground
        
        card1.layer.cornerRadius = 10
        card2.layer.cornerRadius = 10
        
        if let safeToLoad = selectedWine {
            productName.text = safeToLoad.wineName
        }
        
        
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
