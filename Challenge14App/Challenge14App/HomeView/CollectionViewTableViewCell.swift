//
//  CollectionViewTableViewCell.swift
//  Challenge14App
//
//  Created by Luciana Liebl de Freitas on 21/05/26.
//

import UIKit

protocol CollectionViewTableViewCellDelegate: AnyObject{
    func didTapCell(with imageName: String)
}

//Essa clase representa uma linha da tabela
class CollectionViewTableViewCell: UITableViewCell {

    static let identifier = "CollectionViewTableViewCell"
    
    private let images: [String] = ["cover1", "cover2", "cover3", "cover4", "cover5", "cover6", "cover7", "cover8" ]
    
    weak var delegate: CollectionViewTableViewCellDelegate?
    
    private let collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 160, height: 160)
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
        collectionView.register(PosterCollectionViewCell.self, forCellWithReuseIdentifier: PosterCollectionViewCell.identifier)
        
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        contentView.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        applyConstraints()
    }
    
    func applyConstraints(){
        let collectionViewConstraints = [
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 160)
        ]
        
        NSLayoutConstraint.activate(collectionViewConstraints)
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //collectionView.frame = contentView.bounds
    }
    

}

extension CollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    
    //Quantidade de células na linha da tabela
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PosterCollectionViewCell.identifier, for: indexPath) as? PosterCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            let imageName = images[indexPath.item]
            cell.configure(with: imageName)
                    
            return cell
    }
    
    //IndexPath: é um mapa de localização. Para coleções horizontais, ele carrega duas informações principais: a seção (indexPath.section) e o número da posição do quadradinho (indexPath.item), começando do zero (0, 1, 2, 3...)
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //Se o usuário tocou no primeiro pôster, indexPath.item vale 0. O código vai ler images[0], que vai retornar "cover1"
        let imageName = images[indexPath.item]
        
        //a célula está gritando pelo protocolo: "Quem estiver conectado a mim, execute a função didTapCell levando essa imagem aqui!".
        delegate?.didTapCell(with: imageName)
    }
}
