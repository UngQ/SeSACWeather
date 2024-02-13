//
//  ThreeHoursForecastTableViewCollectionViewCell.swift
//  SeSACWeather
//
//  Created by ungQ on 2/13/24.
//

import UIKit
import SnapKit



class ThreeHoursForecastTableViewCollectionViewCell: UICollectionViewCell {
    
	let timeLabel = UILabel()
	let weatherIcon = UIImageView(frame: .zero)
	let tempLabel = UILabel()

	override init(frame: CGRect) {
		super.init(frame: frame)

		configureHierarchy()
		configureLayout()
		configureCell()
	}

	
	func configureHierarchy() {

		contentView.addSubview(timeLabel)
		contentView.addSubview(weatherIcon)
		contentView.addSubview(tempLabel)

	}

	func configureLayout() {


		timeLabel.snp.makeConstraints { make in
			make.top.horizontalEdges.equalTo(safeAreaLayoutGuide)
			make.height.equalTo(20)
		}

		weatherIcon.snp.makeConstraints { make in
			make.top.equalTo(timeLabel.snp.bottom)
			make.horizontalEdges.equalTo(safeAreaLayoutGuide)
			make.height.equalTo(40)
		}

		tempLabel.snp.makeConstraints { make in
			make.top.equalTo(weatherIcon.snp.bottom)
			make.horizontalEdges.equalTo(safeAreaLayoutGuide)
			make.height.equalTo(20)
		}



	}

	func configureCell() {

		timeLabel.textAlignment = .center
		timeLabel.font = .boldSystemFont(ofSize: 12)

		weatherIcon.contentMode = .scaleAspectFill

		tempLabel.textAlignment = .center
		tempLabel.font = .boldSystemFont(ofSize: 12)
	}


	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

extension ThreeHoursForecastTableViewCollectionViewCell {
	static func configureCollectionViewCellLayout() -> UICollectionViewFlowLayout {
		let layout = UICollectionViewFlowLayout()
		let spacing: CGFloat = 12
		let cellWidth = UIScreen.main.bounds.width - (spacing * 6)

		layout.itemSize = CGSize(width: cellWidth / 5, height: cellWidth / 5 * 1.5)
		layout.sectionInset = UIEdgeInsets(top: spacing, left: 0, bottom: 0, right: 0)
		layout.minimumLineSpacing = spacing
		layout.minimumInteritemSpacing = 0
		layout.scrollDirection = .horizontal

		return layout
	}

}
