//
//  GeneralInfoTitleView.swift
//  Sample-GeneralInfo
//
//  Created by Ronaldo Gomes on 8/2/18.
//  Copyright © 2018 Technophile. All rights reserved.
//

import UIKit
import SnapKit

class GeneralInfoTitleView: GeneralInfoViewBuilder {
    
    var title: String
    
    init(title: String) {
        self.title = title
    }
    
    func build() -> UIView {
        let view = UIView()
        view.backgroundColor = .yellow
        
        let titleLabel = UILabel()
        titleLabel.text = self.title
        titleLabel.textAlignment = .center
        view.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(50)
            make.left.right.centerY.equalToSuperview()
        }
        
        return view
    }
    
}
