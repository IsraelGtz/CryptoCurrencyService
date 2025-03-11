// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import MCNetworkService

@MainActor
public final class CryptoCurrencyService {
    private let networkService = MCNetworkService()
    private let decoder = JSONDecoder()

    public init() {}

    public func getCryptoCurrencies() async throws -> [CryptoCurrency] {
        let cryptoData: CryptoCurrencyResponseData = try await networkService.requestData(from: .cryptoCurrencies)
        return cryptoData.data
    }

    public func getCryptoExchangeHistory(
        of id: String,
        interval: CryptoCurrencyHistoryInterval = .d1
    ) async throws -> [ExchangeCurrencyHistory] {
        let cryptoExchangeHistoryData: ExchangeCurrencyHistoryResponseData = try await networkService.requestData(from: .cryptoExchangeHistory(id: id, intervalTime: interval.rawValue))
        return cryptoExchangeHistoryData.data
    }

    public func getExchangeCurrencies() async throws -> [ExchangeCurrency] {
        let exchangeCurrenciesData: ExchangeCurrencyResponseData = try await networkService.requestData(from: .exchangeCurrencies)
        return exchangeCurrenciesData.rates.exchangeCurrencies
    }
}
