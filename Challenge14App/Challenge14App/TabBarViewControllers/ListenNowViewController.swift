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
    
//    lazy var button: UIButton = {
//        let button = UIButton()
//
//        button.setTitle("Ir para o detalhe do albúm", for: .normal)
//        button.setTitleColor(.systemPink, for: .normal)
//        
//        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
//        
//        return button
//    }()
    
    let sectionTitles: [String] = ["Metal", "Rock", "MPB", "Jazz"]
    
    private let homeFeedTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        
        //Retira as linhas cinzas de cada seção
        table.separatorStyle = .none
        
        //Fica preto no Dark Mode e branco no Light Mode
        table.backgroundColor = .systemBackground
        
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTopBar()
        configureUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
         
        // Remove qualquer deslocamento (transform) e devolve a barra para a posição original (.identity)
        navigationController?.navigationBar.transform = .identity
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        scrollViewDidScroll(homeFeedTable)
    }
    
    func configureTopBar() {
        
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
//        view.addSubview(button)
//        button.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//        ])
    }
    
    func configureUI(){
        view.addSubview(homeFeedTable)
        
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        
        let headerView = HeroHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 470))
        homeFeedTable.tableHeaderView = headerView
    }
        
    
    //Esse método é chamado sempre que a tela calcula o tamanho dos seus elementos (como ao girar o aparelho). Aqui você garante que a tabela sempre ocupe a tela inteira (view.bounds).
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
    }
    
    @objc private func didTapProfile() {
            print("Perfil clicado")
    }
    
    
//    @objc func didTapButton(){
//        self.navigationController?.pushViewController(AlbumDetailViewController(), animated: true)
//    }
    
}
 

extension ListenNowViewController: UITableViewDelegate, UITableViewDataSource{
    
    //Diz para a tabela criar tantas seções quantas forem as strings no seu array sectionTitles
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    //Cada seção terá apenas 1 linha
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier:CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else{
            return UITableViewCell()
        }
        
        cell.delegate = self
        
        return cell
    }
    
    //Altura da célula
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
    //Altura da seção
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    //Insere o título de cada seção
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {return}

        let font = UIFont.preferredFont(forTextStyle: .title2)
        
        //Negrito usando dynamicType
        if let boldDescriptor = font.fontDescriptor.withSymbolicTraits(.traitBold){
            header.textLabel?.font = UIFont(descriptor: boldDescriptor, size: 0)
        }else{
            header.textLabel?.font = font
        }
        
        header.textLabel?.adjustsFontForContentSizeCategory = true
        header.textLabel?.textColor = .label
        header.backgroundView?.backgroundColor = .clear
    }
        
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    //Função para esconder a toolbar quando escrola verticalmente
    func scrollViewDidScroll(_ scrollView: UIScrollView){
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset
        
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }
}

extension ListenNowViewController: CollectionViewTableViewCellDelegate{
    
    func didTapCell(with imageName: String) {
        
        //Instanciando a próxima tela
        let nextView = AlbumDetailViewController()
        
        
       // navigationController?.pushViewController(nextView, animated: true)
        self.navigationController?.pushViewController(nextView, animated: true)
    }
}
    

