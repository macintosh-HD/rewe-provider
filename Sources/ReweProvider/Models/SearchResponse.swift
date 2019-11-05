import Vapor

public struct SearchResponse: Content {
    public let search: SearchType
    public let pagination: Pagination
    public let facets: [Facet]
    public let _embedded: EmbeddedProducts
    public let toggles: [Toggle]
    public let seoData: SeoData
    public let marketInfo: MarketInfo
}

public struct SearchType: Content {
    public let term: String
    public let sorting: SortingType
    public let autoCorret: AutoCorrect
    public let marketCode: MarketCode
    public let serviceType: [ServiceType]
    public let selectedFacets: [Facet]
    public let locale: String
    public let activeCategorySlug: String?
}

public struct Pagination: Content {
    public let page: Int
    public let totalPages: Int
    public let objectsPerPage: Int
    public let totalResultCount: Int
}

public struct Facet: Content {
    public let name: FacetName
    public let label: String
    public let displayType: FacetDisplayType
    public let facetConstraints: [FacetConstraints]
}

public struct FacetConstraints: Content {
    public let name: String
    public let label: String
    public let count: Int
    public let applied: Bool
    public let facetFilterQuery: String
    public let slug: String?
}

public struct EmbeddedProducts: Content {
    public let products: [Product]
}
