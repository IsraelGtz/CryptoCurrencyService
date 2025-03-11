//
//  CryptoCurrencyServiceTests.swift
//  MCNetworkService
//
//  Created by Israel Gutiérrez Castillo.
//

@testable import CryptoCurrencyService
import Foundation
import Testing

@MainActor
struct CryptoCurrencyServiceTests {
    let service = CryptoCurrencyService()

    /*
     Request to get a list of crypto currencies succeding
     Expect the service is working and responding with data
     Expect receiving a non empty list of crypto currencies
     Expect receiving more than one crypto
     */
    @Test("Test crypto currencies succeding") func requestCryptoCurrencies_success() async throws {
        // Given the service

        // When
        let cryptoCurrencies = try await service.getCryptoCurrencies()

        // Then
        try #require(cryptoCurrencies.isEmpty == false)
        try #require(cryptoCurrencies.count > 1)
    }

    /*
     Request to get a list of exchange currencies succeding
     Expect the service is working and responding with data
     Expect receiving a non empty list of exchange currencies
     Expect receiving more than one exchange currency
     */
    @Test("Test exchange currencies succeding") func request_ExchangeCurrencies_success() async throws {
        // Given the service

        // When
        let exchangeCurrencies = try await service.getExchangeCurrencies()

        // Then
        try #require(exchangeCurrencies.isEmpty == false)
        try #require(exchangeCurrencies.count > 1)
    }

    /*
     Request to get a list of exchange currency history elements succeding
     Expect the service is working and responding with data
     Expect receiving a non empty list of currency history elements
     Expect receiving more than one currency history element
     */
    @Test("Test crypto history request success") func requestCryptoHistory_success() async throws {
        // Given the service

        // When
        let historyData = try await service.getCryptoExchangeHistory(of: "bitcoin")

        // Then
        try #require(historyData.isEmpty == false)
        try #require(historyData.count > 1)
    }

    /*
     Request to get a list of exchange currency history elements succeding failing
     Expect receiving an error from executing the request with invalid parameters
     */
    @Test("Test crypto currencies request fails") func requestCryptoHistory_fail() async throws {
        // Given the service

        do {
            // When
            _ = try await service.getCryptoExchangeHistory(of: "INVALID_ID")
        } catch {
            // Then
            #expect(error != nil)
        }
    }
}
