//
//  WFTabbarController.swift
//  WineFinderApp
//
//  Created by iain Allen on 27/01/2021.
//

import UIKit

class WFTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllers = [createWineListNC(), createCheckListNC(), createBarCodeScannerNC(), createNewsNC(), createSettingsNC()]
    }
    
    func createWineListNC() -> UINavigationController {
        let wineCategoryVC = WFWineCategroyVC()
        wineCategoryVC.tabBarItem = UITabBarItem(title: "Wine", image: UIImage(named: "wineTab"), tag: 0)
        return  UINavigationController(rootViewController: wineCategoryVC)
    }
    
    func createCheckListNC() -> UINavigationController {
        let checkListVC = WFChecklistVC()
        checkListVC.title = "Checklist"
        checkListVC.tabBarItem = UITabBarItem(title: "Checklist", image: UIImage(systemName: "list.dash"), tag: 1)
        return  UINavigationController(rootViewController: checkListVC)
    }
    
    func createBarCodeScannerNC() -> UINavigationController {
        let barCodeScannerVC = WFBarCodeScannerVC()
        barCodeScannerVC.title = "Scanner"
        barCodeScannerVC.tabBarItem = UITabBarItem(title: "Scan", image: UIImage(systemName: "barcode.viewfinder"), tag: 2)
        return  UINavigationController(rootViewController: barCodeScannerVC)
    }
    
    func createNewsNC() -> UINavigationController {
        let newsVC = WFNewsVC()
        newsVC.title = "News"
        newsVC.tabBarItem = UITabBarItem(title: "News", image: UIImage(systemName: "newspaper"), tag: 3)
        return  UINavigationController(rootViewController: newsVC)
    }
    
    func createSettingsNC() -> UINavigationController {
        let settingsVC = WFSettingsVC()
        settingsVC.title = "Settings"
        settingsVC.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "person.crop.circle"), tag: 3)
        return  UINavigationController(rootViewController: settingsVC)
    }
    
    
    

    

}
