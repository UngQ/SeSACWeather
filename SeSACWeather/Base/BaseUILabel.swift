//
//  BaseUILabel.swift
//  SeSACWeather
//
//  Created by ungQ on 2/13/24.
//

import UIKit


class BaseUILabel: UILabel {

	override init(frame: CGRect) {
		super.init(frame: frame)

		self.font = .boldSystemFont(ofSize: 15)
		self.textAlignment = .center
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
