//
//  CollectionTableViewCell.swift
//  iHunMovieApp
//
//  Created by Hưng Nguyễn on 18/02/2023.
//

import UIKit

class CollectionTableViewCell: UITableViewCell {
    static let identify = "CollectionTableViewCell"
    private var listIma: [Movie] = [Movie]()
    
    
    private let collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 140.0, height:  200)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ListMovieUICollectionViewCell.self, forCellWithReuseIdentifier: ListMovieUICollectionViewCell.identifier)
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemCyan
        
        contentView.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
    
    
    public func config(with movies: [Movie]){
        self.listIma = movies
        
        DispatchQueue.main.async {
            [weak self] in self?.collectionView.reloadData()
        }
    }
    
}

extension CollectionTableViewCell: UICollectionViewDelegate , UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListMovieUICollectionViewCell.identifier, for: indexPath) as? ListMovieUICollectionViewCell else{return UICollectionViewCell()}
        guard let item = listIma[indexPath.row].poster_path
        else {return UICollectionViewCell()}
        cell.config(with:item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listIma.count
    }
}
