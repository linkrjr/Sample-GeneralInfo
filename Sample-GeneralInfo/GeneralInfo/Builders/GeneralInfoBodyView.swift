//
//  GeneralInfoBodyView.swift
//  Sample-GeneralInfo
//
//  Created by Ronaldo Gomes on 8/2/18.
//  Copyright © 2018 Technophile. All rights reserved.
//

import UIKit
import SnapKit

protocol GeneralInfoBodyViewDelegate: class {
    func execute(_ builder: GeneralInfoBodyView)
}

class GeneralInfoBodyView: GeneralInfoViewBuilder, Equatable {
    
    weak var delegate: GeneralInfoBodyViewDelegate?
    
    var backgroundColor: UIColor
    var text: String
    
    init(color: UIColor, text: String) {
        self.backgroundColor = color
        self.text = text
    }
    
    func build() -> UIView {
        let view = UIView()
        view.backgroundColor = self.backgroundColor
        
        let textLabel = UILabel()
        textLabel.numberOfLines = 0
        textLabel.text = self.text
        textLabel.textAlignment = .center
        
        if let _ = self.delegate {
            textLabel.isUserInteractionEnabled = true
            textLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(labelTapped(tap:))))
        }
        
        view.addSubview(textLabel)
        
        textLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(10)
            make.left.right.equalToSuperview()
        }
        
        return view
    }
    
    @objc func labelTapped(tap: UITapGestureRecognizer) {
        self.delegate?.execute(self)
    }
    
    public static func ==(lhs: GeneralInfoBodyView, rhs: GeneralInfoBodyView) -> Bool {
        return lhs.text == rhs.text
    }
}
