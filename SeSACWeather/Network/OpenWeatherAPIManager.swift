//
//  OpenWeatherAPIManager.swift
//  SeSACWeather
//
//  Created by ungQ on 2/10/24.
//

import Foundation
import Alamofire

class OpenWeatherAPIManager {


	static let shared = OpenWeatherAPIManager()
	fileprivate static let dispatchGroup = DispatchGroup()

	private init() {}


	func request( completionHandler: @escaping ((WeatherModel) -> Void)) {

		let url = "https://api.openweathermap.org/data/2.5/weather/"
		let parameters = ["appid": "7970a73cb7d34f8f4e35a1c1ece3b6a0",
						  "id": "1835847",
						  "units": "metric",
						  "lang": "kr"
							]

		AF.request(url, method: .get, parameters: parameters, encoding: URLEncoding(destination: .queryString)).responseDecodable(of: WeatherModel.self) { response in
			



			switch response.result {

			case .success(let success):

				completionHandler(success)
			case .failure(let failure):
				print(failure)
			}
		}
	}

	func dataRequest<T: Codable>(type: T.Type, api: OpenWeatherAPI, completionHandler: @escaping ((T) -> Void)) {
		OpenWeatherAPIManager.dispatchGroup.enter()

		AF.request(api.endPoint,
				   method: api.method,
				   parameters: api.parameter,
				   encoding: api.encoding).responseDecodable(of: T.self) { response in
			switch response.result {
			case .success(let success):
				OpenWeatherAPIManager.dispatchGroup.leave()
//				dump(success)
				completionHandler(success)
			case .failure(let failure):
				OpenWeatherAPIManager.dispatchGroup.leave()
				dump(failure)

				return
			}
		}

	}
}

//api.openweathermap.org/data/2.5/forecast?id=1835847&appid=bf76f8a94ea51b24700e1d3e3851d7b8
