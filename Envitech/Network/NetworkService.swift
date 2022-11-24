//
//  NetworkManager.swift
//  Genesys
//
//  Created by intellithings on 23/11/2022.
//

import Foundation

public class NetworkService: NSObject {
    
    static let shared: NetworkService = {
        return NetworkService()
    }()
    
    func fetchData(onCompletion: @escaping (Result<Response, CustomError>)->()) {
        
        guard Reachability.isConnectedToNetwork() else {
            let error: Error = CustomError.noConnection
            print("❌ Failed to get data: \(error.localizedDescription)")
            onCompletion(.failure(error as! CustomError))
            return
        }
        
        guard let url: URL = URL(string: "https://3294c784-38b0-494b-96ee-d933fa6d7808.mock.pstmn.io/config") else {
            onCompletion(.failure(CustomError.invalidURL))
            return
        }
        
        var request: URLRequest = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let session: URLSession = URLSession(configuration: URLSessionConfiguration.default)
        let task: URLSessionDataTask = session.dataTask(with: request, completionHandler: { data, response, error in
            if let error: Error = error {
                print("❌ Failed to get data: \(error.localizedDescription)")
                onCompletion(.failure(CustomError.invalidURL))
                return
            }
            
            if let data: Data = data {
                do {
                    print("✅ Received data succesfuly")

                    let result = try JSONDecoder().decode(Response.self, from: data)
                    onCompletion(.success(result))
                } catch {
                    let error: Error = CustomError.dataError
                    print("❌ Failed to get data: \(error.localizedDescription)")
                    onCompletion(.failure(error as! CustomError))
                }
            } else {
                let error: Error = CustomError.dataError
                print("❌ Failed to get data: \(error.localizedDescription)")
                onCompletion(.failure(error as! CustomError))
            }
        })
        
        task.resume()
    }
}
