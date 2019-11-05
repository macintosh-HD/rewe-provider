import Vapor

public struct SearchResponse: Content {
    let search: SearchType
    let pagination: Pagination
    let facets: [Facet]
    let _embedded: EmbeddedProducts
    let toggles: [Toggle]
    let seoData: SeoData
    let marketInfo: MarketInfo
}

public struct SearchType: Content {
    let term: String
    let sorting: SortingType
    let autoCorret: AutoCorrect
    let marketCode: MarketCode
    let serviceType: [ServiceType]
    let selectedFacets: [Facet]
    let locale: String
    let activeCategorySlug: String?
}

public struct Pagination: Content {
    let page: Int
    let totalPages: Int
    let objectsPerPage: Int
    let totalResultCount: Int
}

public struct Facet: Content {
    let name: FacetName
    let label: String
    let displayType: FacetDisplayType
    let facetConstraints: [FacetConstraints]
}

public struct FacetConstraints: Content {
    let name: String
    let label: String
    let count: Int
    let applied: Bool
    let facetFilterQuery: String
    let slug: String?
}

public struct EmbeddedProducts: Content {
    let products: [Product]
}
