//
//  CultivationView.swift
//  twelve-months
//
//  Created by Anton Quietzsch on 25.11.20.
//  Copyright © 2020 Anton Quietzsch. All rights reserved.
//

import UIKit

class CultivationView: AvailabilityView {
    private var contentImageView = UIImageView()

    private var availability: Availability!

    init(for availability: Availability, withLabels showsLabels: Bool) {
        super.init(withLabels: showsLabels)
        self.availability = availability
        insertArrangedSubview(contentImageView, at: 0)
        setupViews()
    }

    required init(coder _: NSCoder) { fatalError("init(coder:) has not been implemented") }

    fileprivate func setupViews() {
        contentImageView.image = UIImage(named: "plant-\(availability.rawValue)")
        contentImageView.contentMode = .scaleAspectFit
        contentImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentImageView.widthAnchor.constraint(equalToConstant: 80),
            contentImageView.heightAnchor.constraint(equalToConstant: 80)
        ])
        textLabel.text = "\(optional: availability) Cultivation"
        accessoryLabel.text = "Buy Locally Sourced if Possible"
    }
}
