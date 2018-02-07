//
//  GeneralnfoViewController.swift
//  Sample-GeneralInfo
//
//  Created by Ronaldo Gomes on 8/2/18.
//  Copyright © 2018 Technophile. All rights reserved.
//

import UIKit
import SnapKit

class GeneralnfoViewController: UIViewController {

    var scrollView: UIScrollView = UIScrollView()
    
    var buttonView: UIView = UIView()
    var button: UIButton = UIButton(type: .system)
    
    var builders: [GeneralInfoViewBuilder] = []
    var views: [UIView] = []
    
    func loadBuilders() -> [GeneralInfoViewBuilder] {
        fatalError("Must be implemented by a subclass")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.builders = self.loadBuilders()
        
        self.view.addSubview(self.scrollView)
    
        self.scrollView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
        }
        
        self.views = self.builders.map { $0.build() }
        
        for (index, subview) in self.views.enumerated() {
            
            self.scrollView.addSubview(subview)

            subview.snp.makeConstraints({ make in
                
                make.left.equalTo(0)
                make.width.equalToSuperview()
                
                switch index {
                case 0:
                    make.top.equalToSuperview()
                case self.views.count - 1:
                    make.top.equalTo(self.views[index - 1].snp.bottom)
                    make.bottom.equalTo(0)
                default:
                    make.top.equalTo(self.views[index - 1].snp.bottom)
                }
            })
        }
        
        self.button.setTitle("Click Me!!!", for: .normal)
        self.button.addTarget(self, action: #selector(clickMeTapped), for: .touchUpInside)
        
        self.buttonView.addSubview(self.button)
        self.view.addSubview(self.buttonView)
        
        self.button.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(6)
        }
        
        self.buttonView.snp.makeConstraints { make in
            make.top.equalTo(self.scrollView.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }

    }
    
    @objc func clickMeTapped() {
        let alertVC = UIAlertController(title: "Click Me Clicked", message: "clap, clap, clap!!!", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertVC.addAction(okButton)
        self.present(alertVC, animated: true, completion: nil)
    }
    
}

protocol GeneralInfoViewBuilder {
    func build() -> UIView
}

protocol GeneralInfoViewActionExecutor {
    
}

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
        
        view.snp.makeConstraints { make in
            make.height.equalTo(250)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.right.centerY.equalToSuperview()
        }
        
        return view
    }
    
}

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
        textLabel.text = self.text
        textLabel.textAlignment = .center
        
        if let _ = self.delegate {
            textLabel.isUserInteractionEnabled = true
            textLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(labelTapped(tap:))))
        }
        
        view.addSubview(textLabel)
        
        view.snp.makeConstraints { make in
            make.height.equalTo(350)
        }
        
        textLabel.snp.makeConstraints { make in
            make.left.right.centerY.equalToSuperview()
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
