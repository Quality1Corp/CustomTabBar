//
//  MainTabBarController.swift
//  CustomTabBar
//
//  Created by MikhaiL on 28.04.2023.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsTabBar()
        setTabBarAppearance()
    }
    
    private func settingsTabBar() {
        viewControllers = [
            generate(
                viewController: HomeViewController(),
                title: "Home",
                image: UIImage(systemName: "house.fill")
            ),
            generate(
                viewController: PersonViewController(),
                title: "Person",
                image: UIImage(systemName: "person.fill")
            ),
            generate(
                viewController: SettingsViewController(),
                title: "Settings",
                image: UIImage(systemName: "slider.horizontal.3")
            )
        ]
    }
    
    private func generate(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
    
    private func setTabBarAppearance() {
        let positionOnX: CGFloat = 10
        let positionOnY: CGFloat = 14
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2
        
        let roundLayer = CAShapeLayer()
        let bezierPath = UIBezierPath(
            roundedRect: CGRect(
                x: positionOnX,
                y: tabBar.bounds.minY - positionOnY,
                width: width,
                height: height
            ),
            cornerRadius: height / 2
        )
        
        roundLayer.path = bezierPath.cgPath
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        
        tabBar.itemWidth = width / 5
        tabBar.itemPositioning = .centered
        
        roundLayer.fillColor = UIColor.mainWhite.cgColor
        tabBar.tintColor = .tabBarItemAccent
        tabBar.unselectedItemTintColor = .tabBarItemLight
    }
}
