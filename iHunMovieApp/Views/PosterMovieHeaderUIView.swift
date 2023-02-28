//
//  PosterCarouselCollectionView.swift
//  iHunMovieApp
//
//  Created by Hưng Nguyễn on 18/02/2023.
//

import UIKit

class PosterMovieHeaderUIView: UIView {
    
    private let playBtn: UIButton =  {
        let btn = UIButton()
        btn.setTitle("Play", for: .normal)
        btn.layer.borderColor = UIColor.green.cgColor
        btn.layer.borderWidth = 1
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "play.fill"), for: .normal)
        btn.tintColor = UIColor.green
        btn.semanticContentAttribute = .forceLeftToRight
        btn.setTitleColor(UIColor.systemGreen, for: .normal)
        btn.layer.cornerRadius = 10
        return btn
    }()
    
    private let downloadBtn: UIButton =  {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "square.and.arrow.down"), for: .normal)
        btn.tintColor = UIColor.red
        btn.semanticContentAttribute = .forceRightToLeft
        btn.setTitleColor(UIColor.systemRed, for: .normal)
        btn.layer.borderColor = UIColor.red.cgColor
        btn.layer.borderWidth = 1
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Download", for: .normal)
        btn.layer.cornerRadius = 10
        return btn
    }()

    
    private let posterImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 20
        image.image = UIImage(named: "poster_movie2")
        return image
    }()
    
    
  private  func gradientLayer(){
        let gradientLayer = CAGradientLayer()
      gradientLayer.colors = [
        UIColor.clear.cgColor,
        UIColor.systemBackground.cgColor
      ]
      gradientLayer.frame = bounds
      layer.addSublayer(gradientLayer)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(posterImageView)
        gradientLayer()
        addSubview(playBtn)
        addSubview(downloadBtn)
        applyConstraint()
    }
    
    private func applyConstraint() {
        let playBtnConstraint = [
            playBtn.leadingAnchor.constraint(equalTo: leadingAnchor,constant:40),
            playBtn.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -70),
            playBtn.widthAnchor.constraint(equalToConstant: 120),
            playBtn.heightAnchor.constraint(equalToConstant: 50)
        ]
       
        
        let downloadBtnConstraint = [
            downloadBtn.trailingAnchor.constraint(equalTo: trailingAnchor,constant:-40),
            downloadBtn.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -70),
            downloadBtn.widthAnchor.constraint(equalToConstant: 120),
            downloadBtn.heightAnchor.constraint(equalToConstant: 50)
        ]
        NSLayoutConstraint.activate(playBtnConstraint)
        NSLayoutConstraint.activate(downloadBtnConstraint)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = bounds
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }

}
