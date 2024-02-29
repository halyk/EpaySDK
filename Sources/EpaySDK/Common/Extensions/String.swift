//
//  String.swift
//  EpaySDK
//
//  Created by a1pamys on 2/17/20.
//  Copyright © 2020 Алпамыс. All rights reserved.
//

import Foundation

extension String {

    var dictionary: [String: Any]? {
        if let data = data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }

    var phoneNumber: String {
        var phone = replacingOccurrences(of: " ", with: "")
        phone = phone.replacingOccurrences(of: "+", with: "")
        phone = phone.replacingOccurrences(of: "(", with: "")
        phone = phone.replacingOccurrences(of: ")", with: "")
        phone = phone.replacingOccurrences(of: "-", with: "")
        return phone
    }
    
    static func formatDictToString(_ dict: [String: Any]) -> String {
           var string = dict.description.replacingOccurrences(of: "\"", with: "")
           string = string.replacingOccurrences(of: ": ", with: "=")
           string = string.replacingOccurrences(of: "[", with: "")
           string = string.replacingOccurrences(of: "]", with: "")
           string = string.replacingOccurrences(of: ", ", with: "&")
           return string
       }
    
    public func separate(by: String) -> String {
        let src = self
        var dst = [String]()
        var i = 1
        for char in src {
            dst.append(String(char))
            if i == 4 || i == 8 || i == 12 {
                dst.append(by)
            }
            i += 1
        }
        return dst.joined(separator: "")
    }
    
    subscript(_ range: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: max(0, range.lowerBound))
        let end = index(start, offsetBy: min(self.count - range.lowerBound,
                                             range.upperBound - range.lowerBound))
        return String(self[start..<end])
    }

    subscript(_ range: CountablePartialRangeFrom<Int>) -> String {
        let start = index(startIndex, offsetBy: max(0, range.lowerBound))
         return String(self[start...])
    }
}
