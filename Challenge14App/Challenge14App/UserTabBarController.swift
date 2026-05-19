//
//  UserTabBarController.swift
//  Challenge14App
//
//  Created by Rebeca Maria de Morais Guimães on 19/05/26.
//

import UIKit

class UserTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.tintColor = .systemPink

        configureTabs()
    }
    
    private func configureTabs() {
        let vc1 = ListenNowViewController()
        let vc2 = BrowseViewController()
        let vc3 = RadioViewController()
        let vc4 = LibraryViewController()
        let vc5 = SearchViewController()
        
        //set tab images
        vc1.tabBarItem.image = UIImage(imageLiteralResourceName: "ListenNowIcon")
        vc2.tabBarItem.image = UIImage(imageLiteralResourceName: "BrowseIcon")
        vc3.tabBarItem.image = UIImage(imageLiteralResourceName: "RadioIcon")
        vc4.tabBarItem.image = UIImage(imageLiteralResourceName: "LibraryIcon")
        vc5.tabBarItem.image = UIImage(imageLiteralResourceName: "SearchIcon")
        
        //set title
        vc1.tabBarItem.title = "Listen Now"
        vc2.tabBarItem.title = "Browse"
        vc3.tabBarItem.title = "Radio"
        vc4.tabBarItem.title = "Library"
        vc5.tabBarItem.title = "Search"
    
        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        let nav3 = UINavigationController(rootViewController: vc3)
        let nav4 = UINavigationController(rootViewController: vc4)
        let nav5 = UINavigationController(rootViewController: vc5)
        
        setViewControllers([nav1, nav2, nav3, nav4, nav5], animated: true)

    }
}

