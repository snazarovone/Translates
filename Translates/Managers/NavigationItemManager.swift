//
//  NavigationItemManager.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

import UIKit

typealias ItemTypeActionHandler = (_ itemType: NavigationItemManager.NavigationItemButtonType?) -> Void
typealias NavigationItemButtonType = NavigationItemManager.NavigationItemButtonType

// swiftlint:disable file_types_order
final class NavigationItemManager {
    
    enum NavigationItemButtonType {
        case back
        case close
    }
    
    enum ItemPosition {
        case left(type: NavigationItemButtonType)
        case right(type: NavigationItemButtonType)
    }
    
    private let navigationItem: UINavigationItem

    init(_ navigationItem: UINavigationItem) {
        self.navigationItem = navigationItem
    }
    
    private func buttonIcon(for navigationItemButtonType: NavigationItemButtonType) -> Any? {
        var image: UIImage?
        var title: String?
        switch navigationItemButtonType {
        case .back:
            image = UIImage(named: "navbar_icon_arrow_left")
            title = nil
        case .close:
            image = UIImage(named: "icon_close")
            title = nil
        }
        
        return image != nil ? image?.withRenderingMode(.alwaysOriginal) : title
    }
    
    private func setButton(
        _ navigationItemButtonType: NavigationItemButtonType,
        isLeft: Bool,
        action: @escaping ItemTypeActionHandler
    ) {
        var blockBarButtonItem: BlockBarButtonItem?
        
        if let image = self.buttonIcon(for: navigationItemButtonType) as? UIImage {
            blockBarButtonItem = BlockBarButtonItem(
                image: image,
                style: .plain,
                type: navigationItemButtonType,
                actionHandler: { type in action(type) }
            )
        }
        
        if let title = self.buttonIcon(for: navigationItemButtonType) as? String {
            blockBarButtonItem = BlockBarButtonItem(
                title: title,
                style: .plain,
                type: navigationItemButtonType,
                actionHandler: { type in action(type) }
            )
        }
        
        guard let existingBlockBarButtonItem = blockBarButtonItem else {
            return
        }
        
        if isLeft {
            navigationItem.leftBarButtonItem = existingBlockBarButtonItem
        } else {
            navigationItem.rightBarButtonItem = existingBlockBarButtonItem
        }
    }
    
    internal func setLeftButton(
        _ navigationItemButtonType: NavigationItemButtonType,
        action: @escaping ItemTypeActionHandler
    ) {
        setButton(navigationItemButtonType, isLeft: true, action: action)
    }
    
    internal func setRightButton(
        _ navigationItemButtonType: NavigationItemButtonType,
        action: @escaping ItemTypeActionHandler
    ) {
        setButton(navigationItemButtonType, isLeft: false, action: action)
    }
    
    private func changeRightButton(to navigationItemButtonType: NavigationItemButtonType) {
        if let rightBarButtonItem = navigationItem.rightBarButtonItem as? BlockBarButtonItem {
            if let image = self.buttonIcon(for: navigationItemButtonType) as? UIImage {
                rightBarButtonItem.image = image
            }
            
            if let title = self.buttonIcon(for: navigationItemButtonType) as? String {
                rightBarButtonItem.title = title
            }
            
            rightBarButtonItem.navigationItemButtonType = navigationItemButtonType
        }
    }
}

private class BlockBarButtonItem: UIBarButtonItem {
    private var actionHandler: ItemTypeActionHandler?
    var navigationItemButtonType: NavigationItemButtonType?
    
    convenience init(
        title: String?,
        style: UIBarButtonItem.Style,
        type: NavigationItemButtonType,
        actionHandler: ItemTypeActionHandler?
    ) {
        self.init(title: title, style: style, target: nil, action: #selector(barButtonItemPressed))
        self.target = self
        self.actionHandler = actionHandler
        self.navigationItemButtonType = type
    }
    
    convenience init(
        image: UIImage?,
        style: UIBarButtonItem.Style,
        type: NavigationItemButtonType,
        actionHandler: ItemTypeActionHandler?
    ) {
        self.init(image: image, style: style, target: nil, action: #selector(barButtonItemPressed))
        self.target = self
        self.actionHandler = actionHandler
        self.navigationItemButtonType = type
    }
    
    @objc func barButtonItemPressed(sender: UIBarButtonItem) {
        actionHandler?(navigationItemButtonType)
    }
}

protocol WithNavigationItem {}

extension WithNavigationItem where Self: UIViewController {
    
    func navigationItem(set position: NavigationItemManager.ItemPosition, action: @escaping ItemTypeActionHandler) {
        switch position {
        case .left(let type):
            NavigationItemManager(navigationItem).setLeftButton(type, action: action)
        case .right(let type):
            NavigationItemManager(navigationItem).setRightButton(type, action: action)
        }
    }
    
}
