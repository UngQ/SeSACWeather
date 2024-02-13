//
//  OpneWeatherModel.swift
//  SeSACWeather
//
//  Created by ungQ on 2/10/24.
//

import Foundation

struct WeatherModel: Codable {
	let coord: Coord
	let weather: [Weather]
	let base: String
	let main: Main
	let visibility: Int
	let wind: Wind
	let clouds: Clouds
	let dt: Int
	let timezone, id: Int
	let name: String
	let cod: Int
}

struct Clouds: Codable {
	let all: Int
}

struct Coord: Codable {
	let lon: Double
	let lat: Double
}

struct Main: Codable {
	let temp, feelsLike, tempMin, tempMax: Double
	let pressure, humidity: Int

	enum CodingKeys: String, CodingKey {
		case temp
		case feelsLike = "feels_like"
		case tempMin = "temp_min"
		case tempMax = "temp_max"
		case pressure, humidity
	}
}


struct Weather: Codable {
	let id: Int
	let main, description, icon: String
}

struct Wind: Codable {
	let speed: Double
	let deg: Int
}

// forecast

struct ForecastModel: Codable {
//	let cod: String
//	let message, cnt: Int
	let list: [List]
	let city: City
}

struct City: Codable {
	let id: Int
	let name: String
	let coord: Coord
	let country: String
//	let population, timezone, sunrise, sunset: Int
}

struct List: Codable {
	let dt: Int
	let main: MainClass
	let weather: [Weather]
	let clouds: Clouds
	let wind: Wind
	let visibility: Int
	let pop: Double
	let dtTxt: String
	let rain: Rain?

	enum CodingKeys: String, CodingKey {
		case dt, main, weather, clouds, wind, visibility, pop
		case dtTxt = "dt_txt"
		case rain
	}
}

struct MainClass: Codable {
	let temp, feelsLike, tempMin, tempMax: Double
	let pressure, seaLevel, grndLevel, humidity: Int
	let tempKf: Double

	enum CodingKeys: String, CodingKey {
		case temp
		case feelsLike = "feels_like"
		case tempMin = "temp_min"
		case tempMax = "temp_max"
		case pressure
		case seaLevel = "sea_level"
		case grndLevel = "grnd_level"
		case humidity
		case tempKf = "temp_kf"
	}
}

struct Rain: Codable {
	let the3H: Double

	enum CodingKeys: String, CodingKey {
		case the3H = "3h"
	}
}
