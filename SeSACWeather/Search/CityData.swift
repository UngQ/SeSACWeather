//
//  CityData.swift
//  SeSACWeather
//
//  Created by ungQ on 2/13/24.
//

import Foundation

class CityData {

	static func load() -> Data? {

		let fileNm: String = "CityList"

		let extensionType = "json"

		guard let fileLocation = Bundle.main.url(forResource: fileNm, withExtension: extensionType) else { return nil }

		do {
			let data = try Data(contentsOf: fileLocation)
			return data
		} catch {
			return nil
		}
	}
}
