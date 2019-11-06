import Vapor

public struct ReweSearchResponse: Content {
    public let search: ReweSearchType
    public let pagination: RewePagination
    public let facets: [ReweFacet]
    public let _embedded: ReweEmbeddedProducts
    public let toggles: [ReweToggle]?
    public let seoData: ReweSeoData?
    public let marketInfo: ReweMarketInfo?
    public let _links: ReweLink?
}

public struct ReweSearchType: Content {
    public let term: String
    public let sorting: ReweSortingType
    public let autoCorrect: ReweAutoCorrect
    public let marketCode: ReweMarketCode?
    public let serviceTypes: [ReweServiceType]?
    // public let selectedFacets:
    public let locale: String
    public let activeCategorySlug: String?
}

public struct RewePagination: Content {
    public let page: Int
    public let totalPages: Int
    public let objectsPerPage: Int
    public let totalResultCount: Int
}

public struct ReweFacet: Content {
    public let name: ReweFacetName
    public let label: String
    public let displayType: ReweFacetDisplayType?
    public let facetConstraints: [ReweFacetConstraints]
}

public struct ReweFacetConstraints: Content {
    public let name: String
    public let label: String
    public let count: Int
    public let applied: Bool
    public let facetFilterQuery: String
    public let slug: String?
}

public struct ReweEmbeddedProducts: Content {
    public let products: [ReweProduct]
}
