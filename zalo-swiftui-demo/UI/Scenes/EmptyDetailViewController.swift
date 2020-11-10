//
//  EmptyDetailViewController.swift
//  zalo-swiftui-demo
//
//  Created by Thang Nguyen on 11/3/20.
//

import UIKit

public final class EmptyDetailViewController: UIViewController {
    
    public override func inDetail() -> Bool {
        return true
    }
    
    override public func loadView() {
        
        super.loadView()
        let view = UIView()
        view.backgroundColor = .darkGray
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = NSLocalizedString("Empty View Controller", comment: "Nothing here")
        label.textColor = UIColor(white: 1.0, alpha: 0.4)
        label.font = .preferredFont(forTextStyle: .headline)
        view.addSubview(label)
        
        let xConstraint = NSLayoutConstraint(item: label, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0)
        let yConstraint = NSLayoutConstraint(item: label, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.0, constant: 0)
        NSLayoutConstraint.activate([xConstraint, yConstraint])
        
        self.view = view
    }

    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = self.splitViewController!.displayModeButtonItem
        self.navigationItem.leftItemsSupplementBackButton = true
    }
}
