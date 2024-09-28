//
//  UserDataModel.swift
//  Neu-Brutalism Instagram
//
//  Created by Alfian on 26/09/24.
//

import Foundation

struct UserDataModel: Identifiable, Equatable {
	var id = UUID()
	let userName: String
	let profileImage: String
}
