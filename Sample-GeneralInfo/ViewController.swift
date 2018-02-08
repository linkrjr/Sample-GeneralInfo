//
//  ViewController.swift
//  Sample-GeneralInfo
//
//  Created by Ronaldo Gomes on 8/2/18.
//  Copyright © 2018 Technophile. All rights reserved.
//

import UIKit

class ViewController: GeneralnfoViewController, GeneralInfoBodyViewDelegate {

    let orangeBuilder: GeneralInfoBodyView = GeneralInfoBodyView(color: .orange, text: "Nunc sit amet nunc eu dolor venenatis convallis iaculis laoreet orci. Donec metus neque, iaculis non elit at, maximus eleifend mauris. Suspendisse potenti. Phasellus massa massa, scelerisque in elementum ac, sollicitudin ornare est. Sed vel vulputate nisi. Morbi sollicitudin gravida urna. Maecenas ipsum odio, bibendum eget dolor eu, euismod molestie risus. Aliquam in augue quis est iaculis tristique. In tincidunt nisi libero, a vehicula risus pulvinar sed. Maecenas mi dui, dictum sed diam ac, pellentesque imperdiet dolor. Mauris sodales neque velit, id congue eros pulvinar et. Aliquam aliquet, tellus vel vestibulum pretium, est orci convallis libero, id pulvinar velit urna ullamcorper diam. Quisque fringilla nibh quis pellentesque posuere. Pellentesque quam dui, aliquam ut tellus at, consectetur sollicitudin libero. Morbi viverra iaculis nisi in sodales. Proin dapibus, velit eget laoreet hendrerit, lorem lorem porttitor massa, non tincidunt purus risus ac lectus. Proin tristique dignissim augue, et pellentesque ligula aliquam et. Phasellus eget mollis nisl. Vivamus tristique consectetur urna, quis lacinia sapien. Sed cursus, nisi finibus tempor mollis, purus metus eleifend metus, mattis tincidunt ante sem vitae libero. Praesent pretium nisl ac lacus placerat, fringilla tempus ipsum ornare. Integer vestibulum dictum magna, vel ullamcorper risus. Vivamus diam velit, accumsan sed leo ac, tristique maximus purus. Sed eu rutrum eros. Donec feugiat dolor non congue dapibus. Aliquam tellus massa, luctus at erat ac, vestibulum sagittis tortor. et malesuada fames ac ante ipsum primis in faucibus. Nam condimentum pellentesque libero, nec dignissim dolor hendrerit nec. Pellentesque mattis, erat id condimentum rutrum, mi ipsum molestie quam, eget aliquet felis libero ut est. In hac habitasse platea dictumst. Etiam ullamcorper volutpat lorem ut maximus. Suspendisse varius mattis turpis, id venenatis orci pellentesque vitae. Etiam viverra sem metus, posuere cursus lectus luctus non. Suspendisse potenti. Morbi semper dolor ligula, quis venenatis ipsum congue non. Mauris viverra ante sapien, quis molestie massa consectetur eget. Cras vitae iaculis mi. Pellentesque eget finibus enim. Donec suscipit elit arcu, vitae auctor erat placerat viverra. Donec eu nunc laoreet, ultricies augue at, vulputate arcu. Sed non nisi ut orci porta sagittis. Morbi vel ultrices odio.")
    let greenBuilder: GeneralInfoBodyView = GeneralInfoBodyView(color: .green, text: "Phasellus ut lacus quis velit posuere hendrerit")
    
    override func loadBuilders() -> [GeneralInfoViewBuilder] {
        var builders = [GeneralInfoViewBuilder]()
        builders.append(GeneralInfoTitleView(title: "This is the Title"))
        
        orangeBuilder.delegate = self
        builders.append(orangeBuilder)
        
        builders.append(GeneralInfoBodyView(color: .purple, text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam id velit non nibh bibendum suscipit at aliquet metus. Mauris aliquam ex quis purus suscipit pulvinar. Nunc lorem sem, fermentum id fermentum sit amet, volutpat congue ex. In rutrum ultrices mi vel auctor. Donec at ex libero. Nulla facilisi. Quisque ullamcorper varius turpis, non volutpat eros molestie at. Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut convallis est non laoreet suscipit. Donec sit amet tincidunt justo. Mauris imperdiet non diam vel feugiat. Donec tempor enim malesuada libero pretium pulvinar. Ut eu quam at est commodo dictum nec ac tortor. Vestibulum pellentesque sem fermentum euismod aliquet."))
        
        greenBuilder.delegate = self
        builders.append(greenBuilder)        
        
        builders.append(GreyBoxGeneralInfoView(text: "I am a gray box!!!"))
        
        return builders
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func execute(_ builder: GeneralInfoBodyView) {
        
        var text: String = ""        
        if builder === self.greenBuilder {
            text = "Green Builder"
        } else if builder === self.orangeBuilder {
            text = "Orange Builder"
        } else {
            text = "a label"
        }
        
        let alertVC = UIAlertController(title: "Label Action", message: "I happened after \(text) has been tapped", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertVC.addAction(okButton)
        self.present(alertVC, animated: true, completion: nil)
    }
    
}
