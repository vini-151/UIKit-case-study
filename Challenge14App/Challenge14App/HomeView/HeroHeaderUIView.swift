//
//  HeroHeaderUIView.swift
//  Challenge14App
//
//  Created by Luciana Liebl de Freitas on 21/05/26.
//

import UIKit

class HeroHeaderUIView: UIView {

    private let firstTitle: UILabel = {
        let label = UILabel()
        label.text = "Top Picks"
        
        //Fonte para usar o dynamic type
        let font = UIFont.preferredFont(forTextStyle: .title2)
        
        //Negrito usando dynamicType
        if let boldDescriptor = font.fontDescriptor.withSymbolicTraits(.traitBold){
            label.font = UIFont(descriptor: boldDescriptor, size: 0)
        }else{
            label.font = font
        }
        //Permite a letra crescer se o user aumentar a letra
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let images: [String] = ["cover1", "cover2", "cover3", "cover4", "cover5", "cover6", "cover7", "cover8" ]
    
    private let heroCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        // Ajustamos o tamanho para o formato retangular de banner que você já usava (278x362)
        layout.itemSize = CGSize(width: 278, height: 362)
        layout.scrollDirection = .horizontal
        // Espaçamento entre os banners
        layout.minimumLineSpacing = 16
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        
        // REUSO DE CÓDIGO: Registramos a mesma célula de poster que você criou antes!
        collectionView.register(PosterCollectionViewCell.self, forCellWithReuseIdentifier: PosterCollectionViewCell.identifier)
        return collectionView
    }()


    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(firstTitle)
        addSubview(heroCollectionView)
        
        heroCollectionView.delegate = self
        heroCollectionView.dataSource = self
        
        applyConstraints()
    }
    
    private func applyConstraints(){
        
        let titleConstraints = [
            firstTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            firstTitle.topAnchor.constraint(equalTo: topAnchor, constant: 16)
        ]
        
        let imageConstraints = [
            heroCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            heroCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            heroCollectionView.topAnchor.constraint(equalTo: firstTitle.bottomAnchor, constant: 22),
            heroCollectionView.heightAnchor.constraint(equalToConstant: 365)
        ]
        
        NSLayoutConstraint.activate(titleConstraints)
        NSLayoutConstraint.activate(imageConstraints)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroCollectionView.layer.cornerRadius = 20
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

}

extension HeroHeaderUIView: UICollectionViewDelegate, UICollectionViewDataSource{
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
}
