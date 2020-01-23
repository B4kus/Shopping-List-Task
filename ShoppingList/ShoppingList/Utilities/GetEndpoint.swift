//
//  GetEndpoint.swift
//  ShoppingList
//
//  Created by Szymon Szysz on 21/12/2019.
//  Copyright © 2019 Szymon Szysz. All rights reserved.
//

import Foundation

struct GetEndpoint<Resource: Decodable> {
    var path: String { return "https://www.freeforexapi.com/api/live" }
    var parameters: [String: Any]
}
