import Vapor

public struct ReweGeoLocation: Content {
    public let latitude: String
    public let longitude: String
    public let city: String
    public let state: String
    public let success: Bool
}

public typealias RewePostalCode = String

public struct ReweAddress: Content {
    public let postalCode: RewePostalCode
    public let street: String
    public let city: String
    public let houseNumber: String
}

public struct ReweCompany: Content {
    public let name: String
    public let street: String
    public let zipCode: RewePostalCode
    public let city: String
}

public struct ReweMarketType: Content {
    public let name: String
    public let id: String
}

public struct ReweOpeningHours: Content {
    public let condensed: [ReweCondensedOpeningHours]
}

public struct ReweCondensedOpeningHours: Content {
    public let days: String
    public let hours: String
}

public struct ReweSpecialOpeningTimes: Content {
    public let wwIdent: String
    // public let specialOpeningTimes:
}

public struct ReweMarketOpen: Content {
    public let marketState: ReweMarketState
    public let openTo: String?
    public let openIn: String?
    public let stillOpen: String?
}

public enum ReweMarketState: String, Content {
    case OPEN, CLOSE
}

public enum ReweServiceType: String, Content {
    case PICKUP, DELIVERY, PARCEL
}

public enum ReweSortingType: String, Content {
    case RELEVANCE_DESC
}

public struct ReweAutoCorrect: Content {
    public let originalSearchTerm: String
}

public typealias ReweMarketCode = Int

public enum ReweFacetName: String, Content {
    case MERCHANT_TYPE, CATEGORY, ATTRIBUTE, BRAND, MERCHANT_NAME
}

public enum ReweFacetDisplayType: String, Content {
    case MERCHANT_TYPE_TOGGLE, NAV, SIMPLE, FILTER
}

public struct ReweProduct: Content {
    public let nan: String
    public let version: Int
    public let productName: String
    public let description: String
    public let brand: ReweBrand
    public let media: ReweMedia
    public let hasVariants: Bool
    public let hasDiverseVariantPrices: Bool
    public let freeShipping: Bool
    public let _links: ReweLink
    public let id: Int
    public let _embedded: [ReweEmbeddedProductInformation]
}

public struct ReweBrand: Content {
    public let name: String
}

public struct ReweMedia: Content {
    public let images: [ReweImage]
}

public struct ReweImage: Content {
    public let _links: ReweLink
}

public struct ReweLink: Content {
    public let `self`: ReweLinkLink?
    public let detail: ReweLinkLink?
    public let products: ReweLinkLink?
}

public struct ReweLinkLink: Content {
    public let href: String
}

public struct ReweEmbeddedProductInformation: Content {
    public let articles: [ReweArticle]
    public let categories: [ReweCategory]
}

public struct ReweArticle: Content {
    public let id: String
    public let version: Int
    public let gtin: String
    public let _embedded: ReweEmbeddedArticleInformation
}

public struct ReweEmbeddedArticleInformation: Content {
    public let listing: ReweListing
    public let store: ReweStore
    public let merchant: ReweMerchant
}

public struct ReweListing: Content {
    public let id: String
    public let version: Int
    public let pricing: RewePricing
    public let limitations: ReweLimitations
}

public struct RewePricing: Content {
    public let currentRetailPrice: Int
    public let currency: ReweCurrency
    public let grammage: String
}

public enum ReweCurrency: String, Content {
    case EUR
}

public struct ReweLimitations: Content {
    public let orderLimit: Int
    public let bulkyGoodsShare: Int
}

public struct ReweStore: Content {
    public let id: String
    public let version: Int
}

public struct ReweMerchant: Content {
    public let id: String
    public let version: Int
    public let name: String
    public let type: String
    public let logo: String
    public let shipping: ReweShipping
}

public struct ReweShipping: Content {
    public let deliveryOption: String
    public let carrier: String
    public let centAmount: Int
}

public struct ReweCategory: Content {
    public let primary: Bool
    public let id: String
    public let _links: ReweLink
}

public struct ReweToggle: Content {
    public let name: String
    public let active: Bool
}

public struct ReweSeoData: Content {
    public let canonical: String?
    public let index: Bool
    public let follow: Bool
    public let description: String
    public let pageTitle: String
}

public struct ReweMarketInfo: Content {
    public let bulkyGoodsText: String
}
