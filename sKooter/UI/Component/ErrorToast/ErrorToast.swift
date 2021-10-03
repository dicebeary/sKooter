//
//  ErrorToast.swift
//  sKooter
//
//  Created by Vajda Kristóf on 2021. 10. 03..
//

import Foundation
import SwiftEntryKit

enum ErrorToast {
    static func showError(with title: String, subtitle: String? = nil) {
        var attributes = EKAttributes.topToast
        attributes.entryBackground = .color(color: EKColor(.systemRed))
        attributes.popBehavior = .animated(animation: .init(translate: .init(duration: 1.5), scale: .init(from: 1, to: 0.7, duration: 0.7)))
        attributes.shadow = .active(with: .init(color: .black, opacity: 0.5, radius: 10, offset: .zero))
        attributes.statusBar = .dark
        attributes.scroll = .enabled(swipeable: true, pullbackAnimation: .easeOut)
        attributes.positionConstraints.maxSize = .init(width: .constant(value: UIScreen.main.bounds.width), height: .intrinsic)

        let title = EKProperty.LabelContent(text: title, style: .init(font: .systemFont(ofSize: 16.0), color: .white))
        let description = EKProperty.LabelContent(text: subtitle ?? "", style: .init(font: .systemFont(ofSize: 12.0), color: .white))
        let image = EKProperty.ImageContent(image: UIImage(systemName: "xmark.circle.fill")!.withRenderingMode(.alwaysOriginal).withTintColor(.white), size: CGSize(width: 35, height: 35))
        let simpleMessage = EKSimpleMessage(image: image, title: title, description: description)
        let notificationMessage = EKNotificationMessage(simpleMessage: simpleMessage)

        let contentView = EKNotificationMessageView(with: notificationMessage)
        SwiftEntryKit.display(entry: contentView, using: attributes)
    }
}
