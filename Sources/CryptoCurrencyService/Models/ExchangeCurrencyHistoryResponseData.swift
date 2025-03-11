//
//  ExchangeCurrencyHistoryResponseData.swift
//  CryptoCurrencyService
//
//  Created by Israel Gutiérrez Castillo.
//

import Foundation

struct ExchangeCurrencyHistoryResponseData: Codable {
    let data: [ExchangeCurrencyHistory]
}

public enum CryptoCurrencyHistoryInterval: String {
    case m1
    case m5
    case m15
    case m30
    case h1
    case h2
    case h6
    case h12
    case d1
}

public struct ExchangeCurrencyHistory: Identifiable, Codable {
    public let priceUsd: String
    let time: TimeInterval
    let date: String

    public var id: TimeInterval {
        time
    }

    public var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short

        let date = Date(timeIntervalSince1970: time)
        return formatter.string(from: date)
    }
}
