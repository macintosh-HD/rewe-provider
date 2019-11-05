import Vapor

public struct ReweProvider: Provider {
    public init() {}
    
    public func didBoot(_ container: Container) throws -> Future<Void> {
        return .done(on: container)
    }
    
    public func register(_ services: inout Services) throws {
        services.register { (container) -> (ReweClient) in
            let httpClient = try container.make(Client.self)
            return ReweClient(httpClient: httpClient)
        }
    }
}
