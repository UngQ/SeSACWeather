//
//  MainView.swift
//  SeSACWeather
//
//  Created by ungQ on 2/13/24.
//

import UIKit
import SnapKit

class MainView: BaseView {

	let cityNameLabel = BaseUILabel()
	let currentTempLabel = BaseUILabel()
	let descriptionLabel = BaseUILabel()
	let minMaxTempLabel = BaseUILabel()

	let mainTableView = UITableView()

	override func configureHierarchy() {
		addSubview(cityNameLabel)
		addSubview(currentTempLabel)
		addSubview(descriptionLabel)
		addSubview(minMaxTempLabel)
		addSubview(mainTableView)
	}

	override func configureLayout() {
		cityNameLabel.snp.makeConstraints { make in
			make.top.equalTo(safeAreaLayoutGuide)
			make.height.equalTo(30)
			make.horizontalEdges.equalTo(safeAreaLayoutGuide)
		}

		currentTempLabel.snp.makeConstraints { make in
			make.top.equalTo(safeAreaLayoutGuide).offset(38)
			make.height.equalTo(30)
			make.horizontalEdges.equalTo(safeAreaLayoutGuide)
		}

		descriptionLabel.snp.makeConstraints { make in
			make.top.equalTo(safeAreaLayoutGuide).offset(68)
			make.height.equalTo(30)
			make.horizontalEdges.equalTo(safeAreaLayoutGuide)
		}

		minMaxTempLabel.snp.makeConstraints { make in
			make.top.equalTo(safeAreaLayoutGuide).offset(98)
			make.height.equalTo(30)
			make.horizontalEdges.equalTo(safeAreaLayoutGuide)
		}

		mainTableView.snp.makeConstraints { make in
			make.bottom.horizontalEdges.equalTo(safeAreaLayoutGuide)
			make.top.equalTo(minMaxTempLabel.snp.bottom)
		}
	}

	override func configureView() {

		cityNameLabel.font = .boldSystemFont(ofSize: 20)
		cityNameLabel.backgroundColor = .lightGray
//		currentTempLabel.backgroundColor = .red
//
//		descriptionLabel.backgroundColor = .red
//		minMaxTempLabel.backgroundColor = .red

		mainTableView.backgroundColor = .cyan


	}

}
