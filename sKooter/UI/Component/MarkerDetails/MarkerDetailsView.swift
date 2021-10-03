//
//  MarkerDetailsView.swift
//  sKooter
//
//  Created by Vajda Kristóf on 2021. 10. 03..
//

import UIKit

class MarkerDetailsView: UIView {

    @IBOutlet private var contentView: UIView!
    @IBOutlet private weak var modelLabel: UILabel!
    @IBOutlet private weak var stateImageView: UIImageView!
    @IBOutlet private weak var occupationStateLabel: UILabel!
    @IBOutlet private weak var batteryLabel: UILabel!

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    private func setup() {
        let nib = UINib(nibName: "MarkerDetailsView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)

        self.layer.cornerRadius = 16.0
        self.clipsToBounds = true
    }
}

// MARK: - Binding data
extension MarkerDetailsView {
    struct Data {
        let modelName: String
        let isActive: Bool
        let isOccupied: Bool
        let battery: String
    }

    func bind(to data: Data) {
        modelLabel.text = data.modelName
        stateImageView.image = data.isActive ? Constants.checkMark : Constants.xMark
        occupationStateLabel.text = data.isOccupied ? Localization.MapDetails.occupied : Localization.MapDetails.free
        batteryLabel.text = data.battery
    }
}

// MARK: - Constants
extension MarkerDetailsView {
    enum Constants {
        static let checkMark = UIImage(systemName: "checkmark.circle.fill")
        static let xMark = UIImage(systemName: "xmark.circle.fill")
    }
}
