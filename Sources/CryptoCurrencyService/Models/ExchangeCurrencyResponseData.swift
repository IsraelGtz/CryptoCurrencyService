//
//  ExchangeCurrencyResponseData.swift
//  CryptoCurrencyService
//
//  Created by Israel Gutiérrez Castillo.
//

struct ExchangeCurrencyResponseData: Codable {
    let base: String
    let date: String
    let rates: [String: Double]
}

public struct ExchangeCurrency: Identifiable, Hashable {
    public let id: Currency
    public let rate: Double

    public init(id: Currency, rate: Double) {
        self.id = id
        self.rate = rate
    }
}

public enum Currency: String, Identifiable {
    public var id: String {
        rawValue
    }

    case AUD
    case BGN
    case BRL
    case CAD
    case CHF
    case CNY
    case CZK
    case DKK
    case EUR
    case GBP
    case HKD
    case HUF
    case IDR
    case ILS
    case INR
    case ISK
    case JPY
    case KRW
    case MXN
    case MYR
    case NOK
    case NZD
    case PHP
    case PLN
    case RON
    case SEK
    case SGD
    case THB
    case TRY
    case USD
    case ZAR
}

extension Dictionary where Key == String, Value == Double {
    var exchangeCurrencies: [ExchangeCurrency] {
        let exchangeCurrencies: [ExchangeCurrency] = keys.compactMap { key in
            guard let rate = self[key],
                  let currency = Currency(rawValue: key)
            else {
                return nil
            }
            return ExchangeCurrency(id: currency, rate: rate)
        }
        return exchangeCurrencies
    }
}
