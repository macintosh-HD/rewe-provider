import Vapor

public struct ReweClient: Service {
    let httpClient: Client
    
    let productUrl = "https://shop.rewe.de/api/products"
    let marketUrl = "https://shop.rewe.de/mc/api/markets-stationary"
    
    public init(httpClient: Client) {
        self.httpClient = httpClient
    }
    
    public func fetchMarketsFor(postalCode: String) throws -> Future<MarketResponse> {
        let marketFetchUrl = URL(string: "\(marketUrl)/\(postalCode)")
        
        return httpClient.get(marketFetchUrl).flatMap { response in
            do {
                return try response.content.decode(MarketResponse.self)
            } catch {
                throw Abort(.internalServerError)
            }
        }
    }
    
    public func searchProductsFor(product search: String, market: String? = nil, serviceTypes: [ServiceTypes] = [], sorting: SortingType? = nil, page: Int? = nil, objectsPerPage: Int? = nil) throws -> Future<SearchResponse> {
        var productSearchURL = "\(productUrl)?search=\(search)"
        
        if let marketNotNil = market {
            productSearchURL += "&market=\(marketNotNil)"
        }
        
        if serviceTypes.count > 0 {
            var serviceTypeList: String = serviceTypes.reduce("") { (res, sv) -> String in
                res + "," + sv
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
        
        guard let requestUrl = URL(string: productSearchURL) else {
            throw Abort(.internalServerError)
        }
        
        return httpClient.get(requestUrl).flatMap { response in
            do {
                return try response.content.decode(SearchResponse.self)
            } catch {
                throw Abort(.internalServerError)
            }
        }
    }
}
