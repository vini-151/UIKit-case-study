//
//  UserTabBarController.swift
//  Challenge14App
//
//  Created by Rebeca Maria de Morais Guimães on 19/05/26.
//

import UIKit
import SwiftUI

class UserTabBarController: UITabBarController {
    
    @IBOutlet lazy var miniPlayer: UIView! = {
        let view = UIHostingController(rootView: MiniPlayer()).view!
        
        
        return view
    }()
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.tintColor = .systemPink
        
        configureTabs()
        
        let touchGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        miniPlayer.addGestureRecognizer(touchGesture)
        
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
        
        
        
        view.addSubview(miniPlayer)
        
        miniPlayer.isUserInteractionEnabled = true
        
        
        
        miniPlayer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            miniPlayer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -70),
            miniPlayer.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 1),
        ])
        
        
        
        
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        print("tocou no trem")
        
        if let storyboardMain = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "StoryboardViewControllerID") as? ViewController{
            
            if let sheet = storyboardMain.sheetPresentationController {
                    sheet.detents = [.large()] //Era para fazer a modal ocupar a tela inteira
                    sheet.prefersGrabberVisible = true //Exibe o sinalizador no topo
                }
            
            self.navigationController?.modalPresentationStyle = .pageSheet
            self.present(storyboardMain, animated: true)
//            self.navigationController?.pushViewController(storyboardMain, animated: true)
        }
        
    }
    
}

