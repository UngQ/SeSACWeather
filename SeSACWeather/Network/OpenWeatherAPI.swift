//
//  OpenWeatherAPI.swift
//  SeSACWeather
//
//  Created by ungQ on 2/13/24.
//

import Foundation
import Alamofire

enum OpenWeatherAPI {

	case current(id: Int)
	case forecast(id: Int)


	var baseURL: String {
		return "https://api.openweathermap.org/data/2.5/"
	}

	var endPoint: URL {
		switch self {
		case .current:
			return URL(string: baseURL + "weather")!
		case .forecast:
			return URL(string: baseURL + "forecast")!
		}
	}

	var method: HTTPMethod {
		return .get
	}

	var parameter: Parameters {
		switch self {
		case .current(let id), .forecast(let id):
			return ["appid": OpenWeatherAPIKey.appidID,
					"id": "\(id)",
					"units": "metric",
					"lang": "kr"
			]

		}
	}

	var encoding: URLEncoding {
		return .queryString
	}
}
