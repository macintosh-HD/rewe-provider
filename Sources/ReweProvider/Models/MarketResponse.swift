import Vapor

public struct MarketResponse: Content {
    public let geoLocation: GeoLocation
    public let zipCode: PostalCode
    public let stationaryMarkets: [ReweMarket]
}

public struct ReweMarket: Content {
    public let id: Int
    public let name: String
    public let regionShort: String
    public let address: Address
    public let geoLocation: GeoLocation
    public let phone: String
    public let advertisingCounty: String
    public let company: Company
    public let type: MarketType
    public let openingHours: OpeningHours
    public let specialOpeningTimes: SpecialOpeningTimes?
    public let marketOpen: MarketOpen
    public let availableServiceTypes: [ServiceType]?
    public let distance: String
}
