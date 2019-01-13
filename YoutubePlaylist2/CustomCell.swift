//
//  CustomCell.swift
//  YoutubePlaylist2
//
//  Created by Yüksel Ağgöz on 26.12.2018.
//  Copyright © 2018 Yüksel Ağgöz. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    var lblDescriptionConst = NSLayoutConstraint()
    
    var imgVideo: UIImageView = {
        var imgVideo = UIImageView()
        imgVideo.translatesAutoresizingMaskIntoConstraints = false
        imgVideo.heightAnchor.constraint(equalToConstant: 90).isActive = true
        imgVideo.widthAnchor.constraint(equalToConstant: 120).isActive = true
        return imgVideo
    }()
    
    var lblTitle: UILabel = {
        var lblTitle = UILabel()
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        lblTitle.numberOfLines = 0
        return lblTitle
    }()
    
    var lblDescription: UILabel = {
        var lblDescription = UILabel()
        lblDescription.translatesAutoresizingMaskIntoConstraints = false
        lblDescription.numberOfLines = 0
        return lblDescription
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(imgVideo)
        self.addSubview(lblTitle)
        self.addSubview(lblDescription)
        
        imgVideo.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imgVideo.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        
        imgVideo.trailingAnchor.constraint(equalTo: lblTitle.leadingAnchor).isActive = true
        
        lblTitle.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        lblTitle.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        imgVideo.bottomAnchor.constraint(equalTo: lblDescription.topAnchor).isActive = true
        lblTitle.bottomAnchor.constraint(equalTo: lblDescription.topAnchor).isActive = true
        
        lblDescription.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        lblDescription.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        lblDescription.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        
        lblDescriptionConst = lblDescription.heightAnchor.constraint(equalToConstant: 0)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setExpand(isHidden: Bool) {
        if isHidden == false {
            //lblDescription.isHidden = false
            lblDescription.isEnabled = true
            NSLayoutConstraint.deactivate([lblDescriptionConst])
        } else {
            //lblDescription.isHidden = true
            lblDescription.isEnabled = false
            NSLayoutConstraint.activate([lblDescriptionConst])
        }
    }
}
