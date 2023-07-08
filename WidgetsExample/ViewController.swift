//
//  ViewController.swift
//  WidgetsExample
//
//  Created by CHOI on 2023/07/07.
//

import WidgetKit
import UIKit

class ViewController: UIViewController {
    
    private let field: UITextField = {
        let field = UITextField()
        field.placeholder = "enter text"
        field.backgroundColor = .white
        return field
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemMint
        button.setTitleColor(.white, for: .normal)
        button.setTitle("save", for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .link
        view.addSubview(field)
        view.addSubview(button)
        field.becomeFirstResponder()
        
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        field.frame = CGRect(x: 20, y: view.safeAreaInsets.top+10, width: view.frame.size.width-40, height: 52)
        button.frame = CGRect(x: 30, y: view.safeAreaInsets.top+70, width: view.frame.size.width-60, height: 50)
    }

    @objc
    private func didTapButton() {
        field.resignFirstResponder()
        
        let userDefaults = UserDefaults(suiteName: "group.widgetexamplecache")
        
        guard let text = field.text, !text.isEmpty else {
            return
        }
        
        userDefaults?.setValue(text, forKey: "text")
        WidgetCenter.shared.reloadAllTimelines() // 
    }
}

