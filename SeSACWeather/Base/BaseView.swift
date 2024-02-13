//
//  BaseView.swift
//  SeSACWeather
//
//  Created by ungQ on 2/13/24.
//

import UIKit

class BaseView: UIView {

	override init(frame: CGRect) {
		super.init(frame: frame)

		configureHierarchy()
		configureLayout()
		configureView()
	}


	
	func configureHierarchy() {

	}

	func configureLayout() {

	}

	func configureView() {

	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
