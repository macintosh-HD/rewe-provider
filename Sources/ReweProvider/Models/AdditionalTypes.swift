import Vapor

public struct GeoLocation: Content {
    let latitude: Double
    let longitude: Double
    let city: String
    let state: String
    let success: Bool
}

public typealias PostalCode = String

public struct Address: Content {
    let postalCode: PostalCode
    let street: String
    let city: String
    let houseNumber: Int
}

public struct Company: Content {
    let name: String
    let street: String
    let zipCode: PostalCode
    let city: String
}

public struct MarketType: Content {
    let name: String
    let id: String
}

public struct OpeningHours: Content {
    let condensed: [CondensedOpeningHours]
}

public struct CondensedOpeningHours: Content {
    let days: String
    let hours: String
}

public struct SpecialOpeningTimes: Content {
    let wwIdent: String
    let specialOpeningTimes: Any
}

public struct MarketOpen: Content {
    let marketState: MarketState
    let openTo: String?
    let openIn: String?
    let stillOpen: String?
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
    let originalSearchTerm: String
}

public typealias MarketCode = Int

public enum FacetName: String, Content {
    case MERCHANT_TYPE, CATEGORY, ATTRIBUTE, BRAND, MERCHANT_NAME
}

public enum FacetDisplayType: String, Content {
    case MERCHANT_TYPE_TOGGLE, NAV, SIMPLE, FILTER
}

public struct Product: Content {
    let nan: String
    let version: Int
    let productName: String
    let description: String
    let brand: Brand
    let media: Media
    let hasVariants: Bool
    let hasDiverseVariantPrices: Bool
    let freeShipping: Bool
    let _links: Link
    let id: Int
    let _embedded: [EmbeddedProductInformation]
}

public struct Brand: Content {
    let name: String
}

public struct Media: Content {
    let images: [Image]
}

public struct Image: Content {
    let _links: Link
}

public struct Link: Content {
    let `self`: LinkLink?
    let detail: LinkLink?
    let products: LinkLink?
}

public struct LinkLink: Content {
    let href: String
}

public struct EmbeddedProductInformation: Content {
    let articles: [Article]
    let categories: [Category]
}

public struct Article: Content {
    let id: String
    let version: Int
    let gtin: String
    let _embedded: EmbeddedArticleInformation
}

public struct EmbeddedArticleInformation: Content {
    let listing: Listing
    let store: Store
    let merchant: Merchant
}

public struct Listing: Content {
    let id: String
    let version: Int
    let pricing: Pricing
    let limitations: Limitations
}

public struct Pricing: Content {
    let currentRetailPrice: Int
    let currency: Currency
    let grammage: String
}

public enum Currency: String, Content {
    case EUR
}

public struct Limitations: Content {
    let orderLimit: Int
    let bulkyGoodsShare: Int
}

public struct Store: Content {
    let id: String
    let version: Int
}

public struct Merchant: Content {
    let id: String
    let version: Int
    let name: String
    let type: String
    let logo: String
    let shipping: Shipping
}

public struct Shipping: Content {
    let deliveryOption: String
    let carrier: String
    let centAmount: Int
}

public struct Category: Content {
    let primary: Bool
    let id: String
    let _links: Link
}

public struct Toggle: Content {
    let name: String
    let active: Bool
}

public struct SeoData: Content {
    let canonical: String?
    let index: Bool
    let follow: Bool
    let description: String
    let pageTitle: String
}

public struct MarketInfo: Content {
    let bulkyGoodsText: String
}
