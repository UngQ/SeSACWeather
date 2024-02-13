//
//  SearchView.swift
//  SeSACWeather
//
//  Created by ungQ on 2/13/24.
//

import UIKit
import SnapKit

class SearchView: BaseView {

    let searchBar = UISearchBar()
	let cityListTableView = UITableView()


	override func configureHierarchy() {
		addSubview(searchBar)
		addSubview(cityListTableView)
	}

	override func configureLayout() {
		searchBar.snp.makeConstraints { make in
			make.top.horizontalEdges.equalTo(safeAreaLayoutGuide)
			make.height.equalTo(32)
		}

		cityListTableView.snp.makeConstraints { make in
			make.top.equalTo(searchBar.snp.bottom)
			make.bottom.horizontalEdges.equalTo(safeAreaLayoutGuide)
		}
	}

	override func configureView() {
		cityListTableView.backgroundColor = .darkGray
	}

}
