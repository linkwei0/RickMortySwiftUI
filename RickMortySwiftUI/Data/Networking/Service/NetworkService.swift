//
//  NetworkService.swift
//  RickMortySwiftUI
//
//  Created by Артём Бацанов on 01.06.2024.
//

import Foundation

enum HTTPStatusCode {
    static let okStatus = 200...299
    static let badRequest = 400...499
    static let internalServerError = 500...599
}

enum NetworkError: LocalizedError {
    case clientError
    case serverError
    case unknownError
    case errorInUrl
    case errorDecoding
    
    var errorDescription: String? {
        switch self {
        case .errorDecoding:
            return "Failed to decode data"
        case .serverError:
            return "Server error"
        case .errorInUrl:
            return "Error in URL"
        case .clientError:
            return "Failed in client"
        case .unknownError:
            return "Unknown error"
        }
    }
}

class NetworkService {
//    var session: URLSession { get }
//    func fetch<T: Decodable>(with request: URLRequest, completion: @escaping (Result<T, NetworkError>) -> Void)
//    func fetch(with request: URLRequest, completion: @escaping (Result<Data, NetworkError>) -> Void)
    private let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
}

extension NetworkService {
    func fetch<T: Decodable>(with request: URLRequest, completion: @escaping (Result<T, NetworkError>) -> Void) {
        startRequest(request: request, completion: completion)
    }
    
    func fetch(with request: URLRequest, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        let task = session.dataTask(with: request) { data, _, _ in
            guard let data = data else { return }
            completion(.success(data))
        }
        task.resume()
    }
    
    // MARK: - Private methods
    private func startRequest<T: Decodable>(request: URLRequest, completion: @escaping (Result<T, NetworkError>) -> Void) {
        let task = session.dataTask(with: request) { data, response, _ in
            guard let response = response, let data = data else { completion(.failure(.serverError)); return }
            self.validateResponse(response: response, data: data, completion: completion)
        }
        task.resume()
    }
    
    private func validateResponse<T: Decodable>(response: URLResponse, data: Data,
                                                completion: @escaping (Result<T, NetworkError>) -> Void) {
        guard let httpResponse = response as? HTTPURLResponse else { completion(.failure(.errorInUrl)); return }
        switch httpResponse.statusCode {
        case HTTPStatusCode.okStatus:
            decode(data: data, completion: completion)
        case HTTPStatusCode.badRequest:
            completion(.failure(.clientError))
        case HTTPStatusCode.internalServerError:
            completion(.failure(.serverError))
        default:
            completion(.failure(.unknownError))
        }
    }
    
    private func decode<T: Decodable>(data: Data, completion: @escaping (Result<T, NetworkError>) -> Void) {
        let decoder = JSONDecoder()
        let object = try? decoder.decode(T.self, from: data)
        guard let object = object else { completion(.failure(.errorDecoding)); return }
        completion(.success(object))
    }
    
    // MARK: -
    
    
    
    func fetch<T: Decodable>(with request: URLRequest) async throws -> T {
        return try await startRequest(request: request)
    }
    
//    func fetch(with request: URLRequest, completion: @escaping (Result<Data, NetworkError>) -> Void) {
//        let task = session.dataTask(with: request) { data, _, _ in
//            guard let data = data else { return }
//            completion(.success(data))
//        }
//        task.resume()
//    }
    
    // MARK: - Private methods
    private func startRequest<T: Decodable>(request: URLRequest) async throws -> T {
        let (data, response) = try await session.data(for: request)
        return try await validateResponse(response: response, data: data)
        
//        let task = session.dataTask(with: request) { data, response, _ in
//            guard let response = response, let data = data else { throw NetworkError.serverError; return }
//            self.validateResponse(response: response, data: data, completion: completion)
//        }
//        task.resume()
    }
    
    private func validateResponse<T: Decodable>(response: URLResponse, data: Data) async throws -> T {
        guard let httpResponse = response as? HTTPURLResponse else { throw NetworkError.errorInUrl }
        
        switch httpResponse.statusCode {
        case HTTPStatusCode.okStatus:
            return try await decode(data: data)
        case HTTPStatusCode.badRequest:
            throw NetworkError.clientError
        case HTTPStatusCode.internalServerError:
            throw NetworkError.serverError
        default:
            throw NetworkError.unknownError
        }
    }
    
    private func decode<T: Decodable>(data: Data) async throws -> T {
        let decoder = JSONDecoder()
        let object = try? decoder.decode(T.self, from: data)
        guard let object = object else { throw NetworkError.errorDecoding }
        return object
    }

}
