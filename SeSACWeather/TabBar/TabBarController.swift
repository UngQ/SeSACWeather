//
//  TabBarController.swift
//  SeSACWeather
//
//  Created by ungQ on 2/13/24.
//

import UIKit

final class TabBarController: UITabBarController {

	override func viewDidLoad() {
		super.viewDidLoad()

		self.tabBar.tintColor = .white
		self.tabBar.barTintColor = .black
		self.tabBar.isTranslucent = false
		self.tabBar.unselectedItemTintColor = .lightGray



		let firstVC = UINavigationController(rootViewController: MainViewController())
		firstVC.tabBarItem.title = "메인"
		firstVC.tabBarItem.image = UIImage(systemName: "house")

		let thirdVC = UINavigationController(rootViewController: SearchViewController())
		thirdVC.tabBarItem.title = "검색"
		thirdVC.tabBarItem.image = UIImage(systemName: "map")


		viewControllers = [firstVC]

	}


}
