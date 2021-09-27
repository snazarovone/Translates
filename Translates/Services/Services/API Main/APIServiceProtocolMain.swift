//
//  APIServiceProtocolMain.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

protocol APIServiceProtocolMain {

    var isReachable: Bool { get }
    
    /// You can search in English or translation.
    func performSearchWordRequest(
        _ request: SearchRequest,
        completion: ((Swift.Result<SearchResponseData, Error>) -> Void)?
    )
    
    /// Return full information about meaning
    func performMeaningsRequest(
        _ request: MeaningsRequest,
        completion: ((Swift.Result<MeaningsResponseData, Error>) -> Void)?
    )
}
