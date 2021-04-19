//
//  Container+BaseViewControllerResolving.swift
//  School
//
//  Created by Nikita on 10.04.2021.
//

import Swinject
import UIKit

extension Resolver {
    func resolveController<T: UIViewController, Service>(_ c: T.Type) -> Service? {
        let result = resolve(ModuleFactory<T>.self, name: c.className)
        return result as? Service
    }
}
