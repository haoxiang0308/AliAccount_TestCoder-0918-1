//
//  RandomlyGeneratedViewController.swift
//  RandomApp
//
//  Created by Assistant on 2025-10-10.
//

import UIKit

class RandomlyGeneratedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Example: Setting a background color
        self.view.backgroundColor = UIColor.systemBackground
        
        // Example: Adding a label
        let label = UILabel()
        label.text = "Hello from RandomlyGeneratedViewController!"
        label.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("RandomlyGeneratedViewController is about to appear.")
    }
    
    // Example of a custom function
    func performRandomAction() {
        print("A random action was performed in RandomlyGeneratedViewController.")
    }
}