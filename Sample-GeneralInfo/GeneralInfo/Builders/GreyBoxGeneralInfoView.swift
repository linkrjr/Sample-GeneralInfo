//
//  GreyBoxGeneralInfoView.swift
//  Sample-GeneralInfo
//
//  Created by Ronaldo Gomes on 2/8/18.
//  Copyright © 2018 Technophile. All rights reserved.
//

import Foundation
import SnapKit

class GreyBoxGeneralInfoView: GeneralInfoViewBuilder {
    
    var text: String
    
    init(text: String) {
        self.text = text
    }
    
    func build() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor.gray
        
        let textLabel = UILabel()
        textLabel.text = self.text
        textLabel.textAlignment = .center
        
        view.addSubview(textLabel)
        
        textLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(50)
            make.left.right.equalToSuperview()
        }
        
        return view
    }
    
}
