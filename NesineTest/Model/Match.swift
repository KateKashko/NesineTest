//
//  Match.swift
//  NesineTest
//
//  Created by Kate Kashko on 13.10.2023.
//

import Foundation
// MARK: - MatchElement
struct Match: Codable, Identifiable {
    var code: String?
    var matchName: String?
    var type: String?
    var id: String
    var date: String?
    var time: String?
    var day: String?
    var status: String?
    var ln: String?
    var imf: Bool?
    private var ocg: [String: Ocg]?
    var hec: Bool?
    
    var ocgArray: [(String, Ocg)] {
        if let ocg {
            return Array(ocg.sorted(by: {$0.key < $1.key}))
        }
        return []
    }
    
    enum CodingKeys: String, CodingKey {
        case code = "C"
        case matchName = "N"
        case type = "TYPE"
        case id = "NID"
        case date = "D"
        case time = "T"
        case day = "DAY"
        case status = "S"
        case ln = "LN"
        case imf = "IMF"
        case ocg = "OCG"
        case hec = "HEC"
    }
    
    // MARK: - Ocg
    struct Ocg: Codable, Identifiable {
        var id: String
        var n: String?
        var mbs: String?
        var so: Int?
        private var oc: [String: Oc]?
        
        var ocArray: [(String, Oc)] {
            if let oc {
                return Array(oc.sorted(by: {$0.key < $1.key}))
            }
            
            return []
        }
        
        enum CodingKeys: String, CodingKey {
            case id = "ID"
            case n = "N"
            case mbs = "MBS"
            case so = "SO"
            case oc = "OC"
        }
        
        // MARK: - Oc
        struct Oc: Codable, Identifiable {
            var id: String
            var o : String?
            var n: String?
            var mbs: String?
            var g: String?
            var od: Int?
            var imf: Bool?
            
            enum CodingKeys: String, CodingKey {
                case id = "ID"
                case o = "O"
                case n = "N"
                case mbs = "MBS"
                case g = "G"
                case od = "OD"
                case imf = "IMF"
            }
        }
    }
}
