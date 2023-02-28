//
//  ListMovieUICollectionViewCell.swift
//  iHunMovieApp
//
//  Created by Hưng Nguyễn on 27/02/2023.
//

import UIKit
import SDWebImage

class ListMovieUICollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ListMovieUICollectionViewCell"
    
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
    }
    
    public func config(with model: String){
        guard let url = URL(string: "\(Urls.image_url)\(model)") else{return}
        posterImageView.sd_setImage(with: url,completed: nil)
    }
}
