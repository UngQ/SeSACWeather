//
//  MainViewController.swift
//  SeSACWeather
//
//  Created by ungQ on 2/13/24.
//

import UIKit

class MainViewController: BaseViewController {

	let mainView = MainView()

	var currentWeatherData: WeatherModel?
	static var currentCityID: Int = 1835847

	override func loadView() {
		view = mainView
	}

	override func viewWillAppear(_ animated: Bool) {
		print("willappear")
		OpenWeatherAPIManager.shared.dataRequest(type: WeatherModel.self, api: OpenWeatherAPI.current(id: MainViewController.currentCityID)) { response in
			self.currentWeatherData = response
			self.inputDataInLabel()

			self.mainView.mainTableView.reloadData()

		}
	}


    override func viewDidLoad() {
        super.viewDidLoad()

		let navigationRightBarButton = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(navigationRightBarButtonClicked))
		navigationItem.rightBarButtonItem = navigationRightBarButton

    }

	@objc func navigationRightBarButtonClicked() {
		let vc = SearchViewController()
		vc.valueSpace = { value in
			MainViewController.currentCityID = value


		}


		navigationController?.pushViewController(vc, animated: true)
//		present(vc, animated: true)
	}

	override func configureView() {
		mainView.mainTableView.delegate = self
		mainView.mainTableView.dataSource = self
		mainView.mainTableView.register(ThreeHoursForecastTableViewCell.self, forCellReuseIdentifier: "ThreeHoursForecastTableViewCell")
	}



	func inputDataInLabel() {
		mainView.cityNameLabel.text = currentWeatherData?.name

		guard let temp = currentWeatherData?.main.temp else { return }
		mainView.currentTempLabel.text = "현재 온도 : \(String(describing: temp))"
		mainView.descriptionLabel.text = currentWeatherData?.weather[0].description
		guard let tempMax = currentWeatherData?.main.tempMax else { return }
		guard let tempMin = currentWeatherData?.main.tempMin else { return }
		mainView.minMaxTempLabel.text = "최저 온도 : \(String(describing: tempMin)) | 최고 온도 : \(String(describing: tempMax))"

		mainView.mainTableView.reloadData()

	}

}


extension MainViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "ThreeHoursForecastTableViewCell", for: indexPath) as! ThreeHoursForecastTableViewCell

		cell.inputData()

		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		150
	}


}
