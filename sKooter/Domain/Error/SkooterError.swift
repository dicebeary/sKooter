//
//  SkooterError.swift
//  sKooter
//
//  Created by Vajda Kristóf on 2021. 10. 03..
//

import Foundation

enum SkooterError: Error {
    case generalError
}

extension SkooterError {
    var title: String {
        switch self {
        case .generalError:
            return Localization.errorGeneralTitle
        }
    }

    var subtitle: String? {
        switch self {
        case .generalError:
            return Localization.errorGeneralDescription
        }
    }
}
