//
//  CryptoCurrencyResponseData.swift
//  CryptoCurrencyService
//
//  Created by Israel Gutiérrez Castillo.
//

struct CryptoCurrencyResponseData: Codable {
    let data: [CryptoCurrency]
    let timestamp: Int?
}

public struct CryptoCurrency: Codable, Identifiable {
    public enum VariationType: Codable {
        case increased(Double)
        case decreased(Double)
        case same
        case unknown
    }

    public let id: String
    public let rank: String
    public let symbol: String
    public let name: String
    public let supply: String?
    public let maxSupply: String?
    public let marketCapUsd: String
    public let volumeUsd24Hr: String
    public let priceUsd: String
    public let changePercent24Hr: String?
    public let vwap24Hr: String?
    public let explorer: String?

    public var variation: VariationType {
        guard let changedPct = changePercent24Hr,
              let numericValue = Double(changedPct)
        else {
            return .unknown
        }
        switch numericValue {
        case let x where x == 0:
            return .same
        case let x where x < 0:
            return .decreased(numericValue)
        case let x where x > 0:
            return .increased(numericValue)
        default:
            return .unknown
        }
    }

    public func getPriceUsd(from exchangeCurrency: ExchangeCurrency) -> Double? {
        guard let numericPriceUsd = Double(priceUsd) else {
            return nil
        }
        return exchangeCurrency.rate * numericPriceUsd
    }
}
