//
//  ThreeHoursForecastTableViewCell.swift
//  SeSACWeather
//
//  Created by ungQ on 2/13/24.
//

import UIKit
import SnapKit
import Kingfisher

class ThreeHoursForecastTableViewCell: UITableViewCell {

	let titleLabel = UILabel()
	let forecastCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

	var forecastData: ForecastModel?

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

		print("테이블뷰 다시 하는중")



		configureHierarchy()
		configureLayout()
		configureCell()
	}

	

	func configureHierarchy() {

		contentView.addSubview(titleLabel)
		contentView.addSubview(forecastCollectionView)
	}

	func configureLayout() {
		titleLabel.snp.makeConstraints { make in
			make.top.equalTo(safeAreaLayoutGuide)
			make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(12)
			make.height.equalTo(20)
		}

		forecastCollectionView.snp.makeConstraints { make in
			make.top.equalTo(titleLabel.snp.bottom).offset(4)
			make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(12)
			make.height.equalTo(80)

		}
	}

	func configureCell() {
		titleLabel.text = "3시간 간격의 일기예보"
		titleLabel.font = .boldSystemFont(ofSize: 14)

		forecastCollectionView.dataSource = self
		forecastCollectionView.delegate = self
		forecastCollectionView.collectionViewLayout = ThreeHoursForecastTableViewCollectionViewCell.configureCollectionViewCellLayout()
		forecastCollectionView.register(ThreeHoursForecastTableViewCollectionViewCell.self, forCellWithReuseIdentifier: "ThreeHoursForecastTableViewCollectionViewCell")

		inputData()
	}

	func inputData() {
		OpenWeatherAPIManager.shared.dataRequest(type: ForecastModel.self, api: OpenWeatherAPI.forecast(id: MainViewController.currentCityID)) { response in
			dump(response)
			self.forecastData = response
			self.forecastCollectionView.reloadData()
		}
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}


extension ThreeHoursForecastTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return forecastData?.list.count ?? 0
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ThreeHoursForecastTableViewCollectionViewCell", for: indexPath) as! ThreeHoursForecastTableViewCollectionViewCell

		guard let time = forecastData?.list[indexPath.row].dtTxt else { return cell }
		cell.timeLabel.text = "\(dateFormatter(input: time))시"
		guard let iconPath = forecastData?.list[indexPath.row].weather[0].icon else { return cell }
		let url = URL(string: "https://openweathermap.org/img/wn/\(iconPath)@2x.png")
		cell.weatherIcon.kf.setImage(with: url)
		
		guard let temp = forecastData?.list[indexPath.row].main.temp else { return cell }
		cell.tempLabel.text = "\(String(describing: temp))°C"

		cell.backgroundColor = .green

		

		return cell
	}




}

extension ThreeHoursForecastTableViewCell {

	func dateFormatter(input: String) -> String {
		let dateString = input

		let inputFormatter = DateFormatter()
		inputFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

		guard let date = inputFormatter.date(from: dateString) else { return "" }
		let outputFormatter = DateFormatter()
		outputFormatter.dateFormat = "HH"

		let result = outputFormatter.string(from: date)
		return result
		}
}

