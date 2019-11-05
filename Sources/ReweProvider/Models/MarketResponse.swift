import Vapor

public struct MarketResponse: Content {
    let geoLocation: GeoLocation
    let zipCode: PostalCode
    let stationaryMarkets: [ReweMarket]
}

public struct ReweMarket: Content {
    let id: Int
    let name: String
    let regionShort: String
    let address: Address
    let geoLocation: GeoLocation
    let phone: String
    let advertisingCounty: String
    let company: Company
    let type: MarketType
    let openingHours: OpeningHours
    let specialOpeningTimes: SpecialOpeningTimes?
    let marketOpen: MarketOpen
    let availableServiceTypes: [ServiceType]?
    let distance: String
}
