//
//  GeneralnfoViewController.swift
//  Sample-GeneralInfo
//
//  Created by Ronaldo Gomes on 8/2/18.
//  Copyright © 2018 Technophile. All rights reserved.
//

import UIKit
import SnapKit

protocol GeneralInfoViewBuilder {
    func build() -> UIView
}

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
        self.views = self.builders.map { $0.build() }

        self.buildView()
        self.buildLayout()
        
    }
    
    private func buildView() {
        self.view.addSubview(self.scrollView)
        
        self.button.setTitle("Click Me!!!", for: .normal)
        self.button.addTarget(self, action: #selector(clickMeTapped), for: .touchUpInside)
        
        self.buttonView.addSubview(self.button)
        self.view.addSubview(self.buttonView)
    }
    
    func buildLayout() {
        self.scrollView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
        }
        
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
