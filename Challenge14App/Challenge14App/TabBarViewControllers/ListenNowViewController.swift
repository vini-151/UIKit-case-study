//
//  ListenNowViewController.swift
//  Challenge14App
//
//  Created by Rebeca Maria de Morais Guimães on 19/05/26.
//

import UIKit
import CoreData
import SwiftUI


class ListenNowViewController: UIViewController {
    
    lazy var button: UIButton = {
        let button = UIButton()

        button.setTitle("Ir para o detalhe do albúm", for: .normal)
        button.setTitleColor(.systemPink, for: .normal)
        
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        return button
    }()
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    func configureUI() {
        
        
        
        // Titulo
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Listen Now"
        
        
        // Botão de perfil
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let image = UIImage(systemName: "person.circle", withConfiguration: config)
        let profileButton = UIButton(type: .system)
        
        profileButton.setImage(image, for: .normal)
        profileButton.tintColor = .systemPink
        profileButton.addTarget(self, action: #selector(didTapProfile), for: .touchUpInside)

        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: profileButton)

        // Navegação para o detalhe do album
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        

        
        
        
    }
        
        @objc private func didTapProfile() {
            print("Perfil clicado")
        }
    
    @objc func didTapButton(){
        self.navigationController?.pushViewController(AlbumDetailViewController(), animated: true)
    }
    
    }
    
    

