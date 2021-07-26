//
//  GHTextField.swift
//  GitHubApp
//
//  Created by Rafael Levy on 7/12/21.
//

import UIKit

class GHTextField: UITextField {
    
    let insets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)

    override init(frame:CGRect) {
        // making sure this function has an unique signature at the compile
        // we call the super to make sure we get all the properties
        super.init(frame: frame)
       
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        placeholder = "Enter a username"
        textColor = .label
        tintColor = .label
        textAlignment = .left
        font = .preferredFont(forTextStyle: .title2)
        autocorrectionType = .no
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray3.cgColor
        
        
        let searchIconImageView = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        // color
        searchIconImageView.tintColor = .systemGreen
        searchIconImageView.frame = CGRect(x: 0, y: 0, width: 20, height:20 )

        
        let containerRightView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
        containerRightView.addSubview(searchIconImageView)
        containerRightView.contentMode = UIView.ContentMode.left
        self.rightView = containerRightView
        rightViewMode = .always
        

        
    }
    
}

extension GHTextField {
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
            return rect.inset(by: insets)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let editingRect = super.editingRect(forBounds: bounds)
            return editingRect.inset(by: insets)
    }
}
