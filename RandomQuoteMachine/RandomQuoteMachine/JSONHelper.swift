//
//  JSONHelper.swift
//  RandomQuoteMachine
//
//  Created by Jason Goodney on 7/16/20.
//

import Foundation

struct JSONHelper<T: Decodable> {

    
    enum NetworkError: Error {
        case parseData(message: String)
    }

    
    static func loadJson(filename fileName: String, completion: @escaping (Result<T, NetworkError>) -> Void) {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(T.self, from: data)
                completion(.success(jsonData))
            } catch {
                completion(.failure(.parseData(message: error.localizedDescription)))
            }
        }
    }
//
//    static func readLocalFile(forName name: String) -> Data? {
//           do {
//               if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
//                   let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
//                   return jsonData
//               }
//           } catch {
//               print(error)
//           }
//
//           return nil
//       }
//
//    static func parse(jsonData: Data, completion: @escaping (Result<T, NetworkError>) -> Void) {
//           do {
//               let decodedData = try JSONDecoder().decode(T.self,
//                                                          from: jsonData)
//
//                completion(.success(decodedData))
//           } catch {
//            completion(.failure(.parseData))
//           }
//       }
}
