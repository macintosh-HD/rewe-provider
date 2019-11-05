import Vapor

public struct GeoLocation: Content {
    public let latitude: Double
    public let longitude: Double
    public let city: String
    public let state: String
    public let success: Bool
}

public typealias PostalCode = String

public struct Address: Content {
    public let postalCode: PostalCode
    public let street: String
    public let city: String
    public let houseNumber: Int
}

public struct Company: Content {
    public let name: String
    public let street: String
    public let zipCode: PostalCode
    public let city: String
}

public struct MarketType: Content {
    public let name: String
    public let id: String
}

public struct OpeningHours: Content {
    public let condensed: [CondensedOpeningHours]
}

public struct CondensedOpeningHours: Content {
    public let days: String
    public let hours: String
}

public struct SpecialOpeningTimes: Content {
    public let wwIdent: String
    // public let specialOpeningTimes:
}

public struct MarketOpen: Content {
    public let marketState: MarketState
    public let openTo: String?
    public let openIn: String?
    public let stillOpen: String?
}

public enum MarketState: String, Content {
    case OPEN, CLOSE
}

public enum ServiceType: String, Content {
    case PICKUP, DELIVERY, PARCEL
}

public enum SortingType: String, Content {
    case RELEVANCE_DESC
}

public struct AutoCorrect: Content {
    public let originalSearchTerm: String
}

public typealias MarketCode = Int

public enum FacetName: String, Content {
    case MERCHANT_TYPE, CATEGORY, ATTRIBUTE, BRAND, MERCHANT_NAME
}

public enum FacetDisplayType: String, Content {
    case MERCHANT_TYPE_TOGGLE, NAV, SIMPLE, FILTER
}

public struct Product: Content {
    public let nan: String
    public let version: Int
    public let productName: String
    public let description: String
    public let brand: Brand
    public let media: Media
    public let hasVariants: Bool
    public let hasDiverseVariantPrices: Bool
    public let freeShipping: Bool
    public let _links: Link
    public let id: Int
    public let _embedded: [EmbeddedProductInformation]
}

public struct Brand: Content {
    public let name: String
}

public struct Media: Content {
    public let images: [Image]
}

public struct Image: Content {
    public let _links: Link
}

public struct Link: Content {
    public let `self`: LinkLink?
    public let detail: LinkLink?
    public let products: LinkLink?
}

public struct LinkLink: Content {
    public let href: String
}

public struct EmbeddedProductInformation: Content {
    public let articles: [Article]
    public let categories: [Category]
}

public struct Article: Content {
    public let id: String
    public let version: Int
    public let gtin: String
    public let _embedded: EmbeddedArticleInformation
}

public struct EmbeddedArticleInformation: Content {
    public let listing: Listing
    public let store: Store
    public let merchant: Merchant
}

public struct Listing: Content {
    public let id: String
    public let version: Int
    public let pricing: Pricing
    public let limitations: Limitations
}

public struct Pricing: Content {
    public let currentRetailPrice: Int
    public let currency: Currency
    public let grammage: String
}

public enum Currency: String, Content {
    case EUR
}

public struct Limitations: Content {
    public let orderLimit: Int
    public let bulkyGoodsShare: Int
}

public struct Store: Content {
    public let id: String
    public let version: Int
}

public struct Merchant: Content {
    public let id: String
    public let version: Int
    public let name: String
    public let type: String
    public let logo: String
    public let shipping: Shipping
}

public struct Shipping: Content {
    public let deliveryOption: String
    public let carrier: String
    public let centAmount: Int
}

public struct Category: Content {
    public let primary: Bool
    public let id: String
    public let _links: Link
}

public struct Toggle: Content {
    public let name: String
    public let active: Bool
}

public struct SeoData: Content {
    public let canonical: String?
    public let index: Bool
    public let follow: Bool
    public let description: String
    public let pageTitle: String
}

public struct MarketInfo: Content {
    public let bulkyGoodsText: String
}
