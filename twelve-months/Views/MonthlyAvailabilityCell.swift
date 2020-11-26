//
//  MonthlyAvailabilityCell.swift
//  twelve-months
//
//  Created by Anton Quietzsch on 25.11.20.
//  Copyright © 2020 Anton Quietzsch. All rights reserved.
//

import UIKit

class MonthlyAvailabilityCell: UITableViewCell {
    
    private var availabilityView: AvailabilityView?
    private var ratioView: RatioView!
    private var stackView: UIStackView!
    
    private var type: OverviewSection!
    private var availability: Availability!
    private var ratio: Int!
    
    init(type: OverviewSection, availability: Availability, ratio: Int) {
        super.init(style: .default, reuseIdentifier: "MonthlyCell")
        self.availability = availability
        self.type = type
        self.ratio = ratio
        isUserInteractionEnabled = false
        setupViews()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    fileprivate func setupViews() {
        switch OverviewSection(rawValue: type.rawValue) {
        case .cultivation:
            availabilityView = CultivationView(for: availability, withLabels: true)
        case .importOnly:
            availabilityView = ImportView(for: availability, withLabels: true)
        default: fatalError("Unexpectedly found illegal section \(type!)")
        }
        ratioView = RatioView(for: ratio, withLabels: true)
        stackView = UIStackView(arrangedSubviews: [availabilityView!, ratioView])
        stackView.frame = frame
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalTo: widthAnchor),
            stackView.heightAnchor.constraint(equalTo: heightAnchor)
        ])
    }

}
