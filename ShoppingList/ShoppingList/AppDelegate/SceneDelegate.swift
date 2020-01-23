//
//  SceneDelegate.swift
//  ShoppingList
//
//  Created by Szymon Szysz on 23/01/2020.
//  Copyright © 2020 Szymon Szysz. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

      func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
          guard let windowScene = (scene as? UIWindowScene) else { return }
          window = UIWindow(frame: windowScene.coordinateSpace.bounds)
          window?.windowScene = windowScene
          let viewModel: ShoppingListViewModel = ShoppingListViewModel()
          let viewController = ShoppingListViewController(viewModel: viewModel)
          let navigationController = UINavigationController(rootViewController: viewController)
          window?.rootViewController = navigationController
          window?.makeKeyAndVisible()
      }
}

