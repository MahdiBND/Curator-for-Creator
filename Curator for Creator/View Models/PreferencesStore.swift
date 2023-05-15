//
//  PreferencesStore.swift
//  Curator for Creator
//
//  Created by Mahdi BND on 5/13/23.
//

import Foundation

protocol PreferenceStorable: ObservableObject {
	var favoriteCategoriesPreference: [Category] { get set }
	var loginPreference: Bool { get set }
	func resetPreferences()
}

final class PreferenceStore: PreferenceStorable {
	@Published var favoriteCategoriesPreference: [Category] = value(for: .favoriteCategories, defaultValue: []) {
		didSet {
			set(value: favoriteCategoriesPreference, for: .favoriteCategories)
		}
	}
	
	@Published var loginPreference: Bool = value(for: .login, defaultValue: false) {
		 didSet {
			 set(value: loginPreference, for: .login)
		}
	}
		/// Automatically injects the type `T` which is provided in the function call, to be returned.
		/// - Returns: Returns a value from `UserDefaults` for key, or return the `default` value if nothing found.
	private static func value<T: Codable>(for key: PreferencesKeys, defaultValue: T) -> T {
		guard let data = UserDefaults.standard.value(forKey: key.rawValue) as? Data,
			  let value = try? JSONDecoder().decode(T.self, from: data)  else { return defaultValue }
		return value
	}
	
	private func set<T: Codable>(value: T, for key: PreferencesKeys) {
		if let encoded = try? JSONEncoder().encode(value) {
			UserDefaults.standard.set(encoded, forKey: key.rawValue)
		}
	}
	
	func resetPreferences() {
		let defaults = UserDefaults.standard
		PreferencesKeys.allCases.forEach { setting in
			defaults.removeObject(forKey: setting.rawValue)
		}
	}
}

enum PreferencesKeys: String, CaseIterable {
	case login, favoriteCategories
}
