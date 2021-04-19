//
//  NSObject+className.swift
//  School
//
//  Created by Nikita Zaitsev on 26.03.2021.
//

import Foundation

extension NSObject {
    static var className: String {
        String(describing: Self.self)
    }
}
