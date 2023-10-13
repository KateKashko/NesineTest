//
//  MatchViewModel.swift
//  NesineTest
//
//  Created by Kate Kashko on 13.10.2023.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var matches: [Match] = []
    
    // MARK: - Dependencies
    private let endpoint: Endpoint
    private var networkManager: NetworkManager
    
    // MARK: - init(:)
    init(
        matches: [Match] = .init(),
        endpoint: Endpoint = .init(),
        networkManager: NetworkManager = .init()
    ) {
        self.matches = matches
        self.endpoint = endpoint
        self.networkManager = networkManager
    }
    
    func getMatchData() async {
        do {
            let result = try await networkManager.getDataBets(by: endpoint.url)
            
            await MainActor.run {
                self.matches = result
            }
            
        } catch {
            print(error.localizedDescription)
        }
    }
}
