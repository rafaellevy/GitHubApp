//
//  GHBodyLabel.swift
//  GitHubApp
//
//  Created by Rafael Levy on 7/27/21.
//

import UIKit

class GHBodyLabel: UILabel {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        
    }
    
    convenience init(textAlignment: NSTextAlignment, numberOfLines: Int) {
        self.init(frame: .zero)
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        font = UIFont.preferredFont(forTextStyle: .body)
        textColor = UIColor.secondaryLabel
        minimumScaleFactor = 0.7
        lineBreakMode = .byWordWrapping
        
        
    }
        
    

}
