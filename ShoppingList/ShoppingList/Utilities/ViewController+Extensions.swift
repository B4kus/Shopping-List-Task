//
//  ViewController+Extensions.swift
//  ShoppingList
//
//  Created by Szymon Szysz on 23/01/2020.
//  Copyright © 2020 Szymon Szysz. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlert(withTitle title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
