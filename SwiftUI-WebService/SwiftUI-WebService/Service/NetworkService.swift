//
//  NetworkService.swift
//  SwiftUI-WebService
//
//  Created by Metin Donmez on 21.08.2022.
//

import Foundation

protocol NetworkService {
    func download(_ resourceName: String) async throws -> [User]
    var type : String { get }
}
