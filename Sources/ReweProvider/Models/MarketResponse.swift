import Vapor

public struct ReweMarketResponse: Content {
    public let geoLocation: ReweGeoLocation
    public let zipCode: RewePostalCode
    public let stationaryMarkets: [ReweMarket]
}

public struct ReweMarket: Content {
    public let id: Int
    public let name: String
    public let regionShort: String
    public let address: ReweAddress
    public let geoLocation: ReweGeoLocation
    public let phone: String
    public let advertisingCounty: String
    public let company: ReweCompany
    public let type: ReweMarketType
    public let openingHours: ReweOpeningHours
    public let specialOpeningTimes: ReweSpecialOpeningTimes?
    public let marketOpen: ReweMarketOpen
    public let availableServiceTypes: [ReweServiceType]?
    public let distance: String
}
