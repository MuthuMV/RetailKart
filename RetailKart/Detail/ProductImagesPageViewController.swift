//
//  ProductImagesPageViewController.swift
//  RetailKart
//
//  Created by Muthu on 8/14/19.
//  Copyright © 2019 Muthu. All rights reserved.
//

import UIKit

protocol ProductImagesPageViewControllerDelegate: class {
    func setupPageController(numberOfPages: Int)
    func turnPageController(to index: Int)
}

class ProductImagesPageViewController: UIPageViewController {
    
    var images: [UIImage]?
    weak var pageViewControllerDelegate: ProductImagesPageViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        automaticallyAdjustsScrollViewInsets = false

        delegate = self
        dataSource = self
        
        self.turnToPage(index: 0)
    }
    
    //Not needed on load, so Lazy
    lazy var controllers: [UIViewController] = {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var controllers = [UIViewController]()
        
        if let images = self.images {
            for image in images {
                let productImageVC = storyboard.instantiateViewController(withIdentifier: StoryBoardIdentifiers.productImageViewController)
                controllers.append(productImageVC)
            }
        } else {
            let productImageVC = storyboard.instantiateViewController(withIdentifier: StoryBoardIdentifiers.productImageViewController)
            controllers.append(productImageVC)
        }
        
        self.pageViewControllerDelegate?.setupPageController(numberOfPages: controllers.count)
        return controllers
    }()
    
    func turnToPage(index: Int)
    {
        if !controllers.isEmpty {
            let controller = controllers[index]
            var direction = UIPageViewController.NavigationDirection.forward
            
            if let currentVC = viewControllers?.first {
                let currentIndex = controllers.index(of: currentVC)!
                if currentIndex > index {
                    direction = .reverse
                }
            }
            
            self.configureDisplaying(viewController: controller)
            setViewControllers([controller], direction: direction, animated: true, completion: nil)
        }
    }
    
    func configureDisplaying(viewController: UIViewController)
    {
        for (index, vc) in controllers.enumerated() {
            if viewController === vc { //checks both controllers are pointing to same memory
                if let productImageVC = viewController as? ProductImageViewController {
                    productImageVC.image = self.images?[index] ?? UIImage(named: "No image")!
                    self.pageViewControllerDelegate?.turnPageController(to: index)
                }
            }
        }
    }
}

extension ProductImagesPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let index = controllers.index(of: viewController) {
            if index > 0 {
                return controllers[index-1]
            }
        }
        return controllers.last
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let index = controllers.index(of: viewController) {
            if index < controllers.count - 1 {
                return controllers[index + 1]
            }
        }
        return controllers.first
    }
}

extension ProductImagesPageViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]){
        self.configureDisplaying(viewController: pendingViewControllers.first as! ProductImageViewController)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if !completed {
            self.configureDisplaying(viewController: previousViewControllers.first as! ProductImageViewController)
        }
    }
}
