//
//  UIViewController+StoryboardInitable.swift
//  School
//
//  Created by Импрув on 07.04.2021.
//

import UIKit

extension UIViewController {
    @discardableResult
    static func fromStoryboard() -> Self {
        let storyboard = UIStoryboard(name: Self.className, bundle: nil)

        if let controller = storyboard.instantiateInitialViewController() as? Self {
            return controller
        } else if let controller = storyboard.instantiateViewController(withIdentifier: Self.className) as? Self {
            return controller
        }

        fatalError("No \(Self.className)")
    }
}
