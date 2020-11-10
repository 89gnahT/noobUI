//
//  SplitViewController.swift
//  zalo-swiftui-demo
//
//  Created by Thang Nguyen on 11/3/20.
//

import UIKit

public protocol SplitViewControllerProtocol {

    func inDetail() -> Bool
    
}

public class SplitViewController: UISplitViewController {
    
    var currentTab: Int = 0
    
    public init(masterViewController: UIViewController, emptyDetailViewController: UIViewController = EmptyDetailViewController()) {
        
        self.emptyDetailViewController = emptyDetailViewController
        super.init(nibName: nil, bundle: nil)
        
//        let navEmpty = UINavigationController(rootViewController: self.emptyDetailViewController)

        if masterViewController is UINavigationController || masterViewController is UITabBarController {
            self.viewControllers = [masterViewController, emptyDetailViewController]
        }

        self.preferredDisplayMode = .allVisible
        self.delegate = self
        
    }
    
    private var emptyDetailViewController: UIViewController
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SplitViewController: UISplitViewControllerDelegate {
    
    // MARK: - LandScape to Portrait
    public func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
    
    public func primaryViewController(forCollapsing splitViewController: UISplitViewController) -> UIViewController? {
        
        let masterController = splitViewController.viewControllers[0]
        if let masterNavController = self.masterNavigationController(masterController) {
            
            let detailController = splitViewController.viewControllers[1]
            if let collapsingVCs = self.detailControllersForCollapsing(detailController) {
                
                var controllers = [UIViewController]()
                for controller in collapsingVCs {
                    if controller == self.emptyDetailViewController {
                        break
                    }
                    controllers.append(controller)
                }
                
                var masterVCs = masterNavController.viewControllers
                masterVCs.append(contentsOf: controllers)
                masterNavController.setViewControllers(masterVCs, animated: false)
                
                return masterController
            }
    
        }
        return nil
    }
    
    
    //MARK: - Portrait to Landscape
    public func primaryViewController(forExpanding splitViewController: UISplitViewController) -> UIViewController? {
        return nil
    }
    
    public func splitViewController(_ splitViewController: UISplitViewController, separateSecondaryFrom primaryViewController: UIViewController) -> UIViewController? {
        
        let masterController = splitViewController.viewControllers[0]
        if let masterNavController = self.masterNavigationController(masterController), let masterVCs = self.masterControllersOnSeparating(masterController) {
            
            var controllers = [UIViewController]()
            for controller in masterVCs.reversed() {
                if controller.inDetail() {
                    masterNavController.popViewController(animated: false)
                    controllers.append(controller)
                }
            }
            if controllers.count > 0 {
                let array: [UIViewController] = controllers.reversed()
                let detail = UINavigationController()
                detail.setViewControllers(array, animated: false)
                return detail
            }
            
        }
        
        return self.emptyDetailViewController
    }
    
    //MARK: - Switching
    
//    public func targetDisplayModeForAction(in svc: UISplitViewController) -> UISplitViewController.DisplayMode {
//        if svc.displayMode == .primaryOverlay || svc.displayMode == .primaryHidden {
//            return .allVisible
//        }
//        return .primaryHidden
//    }
//
    
    //MARK: - Private method
    private func masterNavigationController(_ masterController: UIViewController) -> UINavigationController? {
        if let navController = masterController as? UINavigationController {
            return navController
        }
        if let tabbarController = masterController as? UITabBarController {
            if let currentTabController = tabbarController.selectedViewController as? UINavigationController {
                
                return currentTabController
            }
        }
        return nil
    }
    
    private func detailControllersForCollapsing(_ controller: UIViewController) -> [UIViewController]? {
        if let navController = controller as? UINavigationController {
            return navController.viewControllers
        }
        return [controller]
    }
    
    private func masterControllersOnSeparating(_ masterController: UIViewController) -> [UIViewController]? {
        
        if let navController = masterController as? UINavigationController {
            return navController.viewControllers
        }
        if let tabbarController = masterController as? UITabBarController {
            if let currentTabController = tabbarController.selectedViewController as? UINavigationController {
                return currentTabController.viewControllers
            }
        }
        
        return nil
    }
}
