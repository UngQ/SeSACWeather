//
//  SearchViewTableViewCell.swift
//  SeSACWeather
//
//  Created by ungQ on 2/13/24.
//

import UIKit
import SnapKit

class SearchViewTableViewCell: UITableViewCell {

	let label = UILabel()

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

		contentView.addSubview(label)
		
		label.snp.makeConstraints { make in
			make.edges.equalTo(safeAreaLayoutGuide)
		}

	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
