//
//  SearchViewController.swift
//  SeSACWeather
//
//  Created by ungQ on 2/13/24.
//

import UIKit

class SearchViewController: BaseViewController {

	let mainView = SearchView()

	var cityList: [City]?

	var valueSpace: ((Int) -> Void)?

	override func loadView() {
		view = mainView
	}

	override func viewWillAppear(_ animated: Bool) {
		guard let jsonData = CityData.load() else { return }
		cityList = try? JSONDecoder().decode([City].self, from: jsonData)
	}

    override func viewDidLoad() {
        super.viewDidLoad()


		view.backgroundColor = .black
		

    }

	override func configureView() {
		mainView.cityListTableView.dataSource = self
		mainView.cityListTableView.delegate = self
		mainView.cityListTableView.register(SearchViewTableViewCell.self, forCellReuseIdentifier: "SearchViewTableViewCell")
	}


}


extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return cityList?.count ?? 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "SearchViewTableViewCell", for: indexPath) as! SearchViewTableViewCell

		cell.label.text = cityList?[indexPath.row].name ?? ""

		return cell
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		guard let id = cityList?[indexPath.row].id else { print("error")
			return }
		print(id)
		valueSpace!(id)
//		dismiss(animated: true)
		navigationController?.popViewController(animated: true)
	}

	
}
