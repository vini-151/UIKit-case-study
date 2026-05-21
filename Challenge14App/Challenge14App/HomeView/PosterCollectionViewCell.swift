//
//  PosterCollectionViewCell.swift
//  Challenge14App
//
//  Created by Luciana Liebl de Freitas on 21/05/26.
//

import UIKit

class PosterCollectionViewCell: UICollectionViewCell {
 
    static let identifier = "PosterCollectionViewCell"
    
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //Arredondamento da célula
        contentView.layer.cornerRadius = 20
        // Força todos os elementos dentro da contentView (incluindo a imagem) a seguirem o arredondamento de 20.
        contentView.layer.masksToBounds = true
        
        contentView.addSubview(posterImageView)
        applyConstraints()
    }
    
    private func applyConstraints(){
        
        let imageConstraints = [
            posterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            posterImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            posterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            posterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ]
        
        NSLayoutConstraint.activate(imageConstraints)
    }
    
    func configure(with imageName: String){
        posterImageView.image = UIImage(named: imageName)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
