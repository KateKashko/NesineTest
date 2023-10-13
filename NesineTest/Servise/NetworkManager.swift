//
//  NetworkManager.swift
//  NesineTest
//
//  Created by Kate Kashko on 13.10.2023.
//

import Foundation

// MARK: - NetworkManager
final class NetworkManager {
    
    enum NetworkError: Error {
        case failedURL, failedURLSession, unknown, failedResponse, failedDecoded
    }
    
    
    func getDataBets(by url: String) async throws -> [Match] {
        guard let url = URL(string: url) else {
            throw NetworkError.failedURL
        }
        
        guard let (data, response) = try? await URLSession.shared.data(from: url) else {
            throw NetworkError.failedURLSession
        }
        
        guard let response = response as? HTTPURLResponse else {
            throw NetworkError.unknown
        }
        
        // можно обработать через switch все ошибки
        guard response.statusCode == 200 else {
            throw NetworkError.failedResponse
        }
        
        guard let decoded = try? JSONDecoder().decode([Match].self, from: data) else {
            throw NetworkError.failedDecoded
        }
        
        return decoded
    }
}
