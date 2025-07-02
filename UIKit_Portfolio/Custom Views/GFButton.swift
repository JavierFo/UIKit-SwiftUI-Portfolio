//
//  GFButton.swift
//  UIKit_Portfolio
//
//  Created by Javier FO on 10/06/25.
//

import UIKit

class GFButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundColor: UIColor, title: String, systemImageName: String) {
        super.init(frame: .zero)
        set(backgroundColor: backgroundColor, title: title, systemImageName: systemImageName)
//        self.backgroundColor = backgroundColor
//        self.setTitle(title, for: .normal)
        configure()
    }
    
    private func configure() {
        
        configuration = .tinted()
        configuration?.cornerStyle = .medium
        
        //layer.cornerRadius = 10
        //setTitleColor(.white, for: .normal)
        //titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false // for programatic constraints
    }
    
    func set(backgroundColor: UIColor, title: String, systemImageName: String) {
        
//        configuration?.baseBackgroundColor = backgroundColor
        configuration?.baseForegroundColor = backgroundColor
        configuration?.title = title
        configuration?.image = UIImage(systemName: systemImageName)
        configuration?.imagePadding = 6
        configuration?.imagePlacement = .trailing
        //self.backgroundColor  = backgroundColor
        setTitle(title, for: .highlighted)
    }
    
}
