import Vapor

public struct ReweClient: Service {
    let httpClient: Client
    
    let productUrl = "https://shop.rewe.de/api/products"
    let marketUrl = "https://shop.rewe.de/mc/api/markets-stationary"
    
    public init(httpClient: Client) {
        self.httpClient = httpClient
    }
    
    public func fetchMarketsFor(postalCode: String) throws -> Future<ReweMarketResponse> {
        guard let marketFetchUrl = URL(string: "\(marketUrl)/\(postalCode)") else {
            throw Abort(.internalServerError, reason: "Could not create marketFetchUrl.")
        }
        
        return httpClient.get(marketFetchUrl).flatMap { response in
            do {
                return try response.content.decode(ReweMarketResponse.self)
            } catch {
                throw Abort(.internalServerError)
            }
        }
    }
    
    public func searchProductsFor(product searchTerm: String, market: String? = nil, serviceTypes: [ReweServiceType] = [], sorting: ReweSortingType? = nil, page: Int? = nil, objectsPerPage: Int? = nil, categorySlug: String?) throws -> Future<ReweSearchResponse> {
        guard let search = searchTerm.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            throw Abort(.internalServerError, reason: "Could not encode product-searchterm.")
        }
        
        var productSearchURL = "\(productUrl)?search=\(search)"
        
        if let marketNotNil = market {
            productSearchURL += "&market=\(marketNotNil)"
        }
        
        if serviceTypes.count > 0 {
            var serviceTypeList: String = serviceTypes.reduce("") { (res, sv) -> String in
                res + "," + sv.rawValue
            }
            
            serviceTypeList.removeFirst()
            
            productSearchURL += "&serviceType=\(serviceTypeList)"
        }
        
        if let sortingNotNil = sorting {
            productSearchURL += "&sorting=\(sortingNotNil)"
        }
        
        if let pageNotNil = page {
            productSearchURL += "&page=\(pageNotNil)"
        }
        
        if let objectsPerPageNotNil = objectsPerPage {
            productSearchURL += "&objectsPerPage=\(objectsPerPageNotNil)"
        }
        
        if let categorySlugNotNil = categorySlug {
            productSearchURL += "&categorySlug=\(categorySlugNotNil)"
        }
        
        guard let requestUrl = URL(string: productSearchURL) else {
            debugPrint(productSearchURL)
            throw Abort(.internalServerError)
        }
        
        return httpClient.get(requestUrl).flatMap { response in
            do {
                return try response.content.decode(ReweSearchResponse.self)
            } catch {
                throw Abort(.internalServerError)
            }
        }
    }
}
