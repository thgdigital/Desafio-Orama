//
//  Helper.swift
//  Desafio Orama
//
//  Created by THIAGO on 04/10/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import UIKit


let primaryColor: UIColor = UIColor(red: 141/255, green: 233/255, blue: 110/255, alpha: 1)
let secondaryColor: UIColor = UIColor(red: 220/255, green: 243/255, blue: 1/255, alpha: 1)

protocol Identifier{}

extension Identifier where Self: NSObject{
    
    static var identifier: String { return String(describing: self) }
}

extension NSObject: Identifier {}

extension UIView {
    
    // OUTPUT 1
    func dropShadow(scale: Bool = true, radius: CGFloat = 0) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = radius
        layer.cornerRadius = radius
        
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    // OUTPUT 2
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    func roundCorners(_ corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}


extension UICollectionViewCell {
    func shadowDecorate() {
        let radius: CGFloat = 10
        contentView.layer.cornerRadius = radius
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.masksToBounds = true
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1.0)
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 0.5
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: radius).cgPath
        layer.cornerRadius = radius
    }
}

extension UICollectionView {

  func reloadDataTwiceIfNeeded() {
    reloadData()

    if #available(iOS 11.0, *) {
      // do nothing
    }
    else {
      // do it only if bellow iOS 11
      reloadData()
    }
  }
  
  func reloadItemsInSection(sectionIndex: Int, newCount: Int? = nil, completion: (() -> Void)?) {
    self.performBatchUpdates({
      
      self.collectionViewLayout.invalidateLayout()
      
      var sectionItemsCount: Int = 0
      let collectionView: UICollectionView = self
      
      sectionItemsCount = collectionView.numberOfItems(inSection: sectionIndex)
  
      let countArray = [sectionItemsCount, newCount ?? 0]
      let maxCount = countArray.max() ?? 0
      let minCount = countArray.min() ?? 0
      
      var changed = [IndexPath]()
      for i in minCount..<maxCount {
        let indexPath = IndexPath(row: i, section: sectionIndex)
        changed.append(indexPath)
      }
      
      if (newCount ?? 0) > sectionItemsCount {
        collectionView.insertItems(at: changed)
        
      } else if sectionItemsCount > (newCount ?? 0) {
        collectionView.deleteItems(at: changed)
      }
      
    }, completion:  { _ in
      self.collectionViewLayout.invalidateLayout()
      
//      self.reloadLoadingCells(section: section)
      completion?()
    })
  }
  
    
  func reloadItemsInSection(_ section: Int, completion: (() -> Void)?) {
      
      self.performBatchUpdates({
        
        UIView.performWithoutAnimation {
          
          self.collectionViewLayout.invalidateLayout()
          self.reloadSections( IndexSet(integer: section) )
        }
        
      }) { (finished) in
        self.collectionViewLayout.invalidateLayout()
        completion?()
    }
  }
}

extension UIWindow {
    
    func visibleViewController() -> UIViewController? {
        if let rootViewController: UIViewController = self.rootViewController {
            return UIWindow.getVisibleViewControllerFrom(vc: rootViewController)
        }
        return nil
    }
    
    static func getVisibleViewControllerFrom(vc:UIViewController) -> UIViewController {
        if let navigationController = vc as? UINavigationController,
            let visibleController = navigationController.visibleViewController  {
            return UIWindow.getVisibleViewControllerFrom( vc: visibleController )
        } else if let tabBarController = vc as? UITabBarController,
            let selectedTabController = tabBarController.selectedViewController {
            return UIWindow.getVisibleViewControllerFrom(vc: selectedTabController )
        } else {
            if let presentedViewController = vc.presentedViewController {
                return UIWindow.getVisibleViewControllerFrom(vc: presentedViewController)
            } else {
                return vc
            }
        }
    }
}
