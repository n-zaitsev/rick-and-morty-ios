//
//  ModuleFactory.swift
//  MBXCore
//
//  Created by Stepan Chepurin on 05/07/2017.
//  Copyright © 2017 Improve Digital. All rights reserved.
//

import UIKit

public protocol AbstractModuleFactory {
    var description: String? { get }
    func produceAny<SourceType>(from: SourceType, _ then: (_ source: SourceType, _ destination: UIViewController, _ navigation: UINavigationController) -> Void) where SourceType: UIViewController
}

public struct ModuleFactory<T>: AbstractModuleFactory where T: UIViewController {
    public typealias ProducedType = T

    public let handler: () -> ProducedType
    public let description: String?

    public init(handler: @escaping () -> ProducedType) {
        self.init(handler: handler, description: String(describing: type(of: ProducedType.self)))
    }

    public init(handler: @escaping () -> ProducedType, description: String) {
        self.handler = handler
        self.description = description
    }

    public func produceAny<SourceType>(from: SourceType, _ then: (_ source: SourceType, _ destination: UIViewController, _ navigation: UINavigationController) -> Void) where SourceType: UIViewController {
        return produceWrapped(from: from) { s, d, nc in
            then(s, d, nc)
        }
    }

    public func produceWrapped<SourceType>(from: SourceType, _ then: (_ source: SourceType, _ destination: ProducedType, _ navigation: UINavigationController) -> Void) where SourceType: UIViewController {
        let vc = handler()
        let nc = UINavigationController(rootViewController: vc)

        then(from, vc, nc)
    }

    public func wrappedNavigationStack<SourceType>(from: SourceType, _ then: (_ source: SourceType, _ destination: ProducedType) -> Void) where SourceType: UIViewController {
        let vc = handler()
        let nc = from.navigationController
        from.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: nil, action: nil)
        vc.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: nil, action: nil)
        nc?.popToRootViewController(animated: false)
        nc?.pushViewController(vc, animated: false)
        then(from, vc)
    }

    public func produceToRoot() {
        let vc = handler()
        let nc = vc.navigationController
        nc?.popToRootViewController(animated: false)
    }

    public func produce<SourceType>(from: SourceType, _ then: (_ source: SourceType, _ destination: ProducedType) -> Void) where SourceType: UIViewController {
        let vc = handler()
        then(from, vc)
    }

    public func produceRoot(_ then: ((_ destination: ProducedType) -> Void)? = nil) {
        let vc = handler()
        let nc = UINavigationController(rootViewController: vc)
        UIApplication.shared.delegate?.window??.rootViewController = nc
        then?(vc)
    }

    public func replaceProduce<SourceType>(from: SourceType, _ then: ((_ source: SourceType, _ destination: ProducedType) -> Void)? = nil) where SourceType: UIViewController {
        let vc = handler()

        let navController = from.navigationController

        var viewControllers: [UIViewController] = navController?.viewControllers ?? [from]
        viewControllers.removeLast()
        viewControllers.append(vc)

        navController?.viewControllers = viewControllers

        then?(from, vc)
    }

    public func defaultProduce<SourceType>(from: SourceType, disableBackText: Bool = false, _ then: ((_ source: SourceType, _ destination: ProducedType) -> Void)? = nil) where SourceType: UIViewController {
        let vc = handler()
        if disableBackText {
            from.navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
            vc.navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        } else {
            from.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: nil, action: nil)
            vc.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: nil, action: nil)
        }

        from.navigationController?.pushViewController(vc, animated: true)

        then?(from, vc)
    }

    public func modalProduce<SourceType>(from: SourceType, animated: Bool = true, _ then: (_ source: SourceType, _ destination: ProducedType) -> Void) where SourceType: UIViewController {
        let vc = handler()
        let nc = UINavigationController(rootViewController: vc)

        from.navigationController?.present(nc, animated: animated, completion: nil)
        then(from, vc)
    }

    public func presentModalProduce<SourceType>(from: SourceType, _ then: (_ source: SourceType, _ destination: ProducedType) -> Void) where SourceType: UIViewController {
        let vc = handler()
        from.navigationController?.present(vc, animated: true, completion: nil)
        then(from, vc)
    }

    public func produceWindowRoot() {
        let vc = handler()

        UIApplication.shared.delegate?.window??.rootViewController = vc
    }

    public func produceWindowRoot(_ then: (_ destination: ProducedType) -> Void) {
        let vc = handler()
        UIApplication.shared.delegate?.window??.rootViewController = vc
        then(vc)
    }
}
