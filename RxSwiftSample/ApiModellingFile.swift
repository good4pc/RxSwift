//
//  ApiModellingFile.swift
//  RxSwiftSample
//
//  Created by Suresh on 05/04/18.
//  Copyright © 2018 FIngent. All rights reserved.
//
import UIKit
enum Method : String{
    case GET = "GET"
}
protocol Resource {
    var method : Method{get}
    var path : String {get}
    var parameters : [String:String]{get}
}
extension Resource{
    var method : Method{
        return .GET
    }
    func requestWithBaseUrl(baseUrl : NSURL)->NSURLRequest{
        let url = baseUrl.appendingPathComponent(path)
        
        guard let components = NSURLComponents(url: url!, resolvingAgainstBaseURL: false) else{
            fatalError("Unable to create url components from url ->\(String(describing: url))")
        }
        components.queryItems = parameters.map({return URLQueryItem(name: String($0), value: String($1))})
        guard let finalUrl = components.url else{
            fatalError("Unable to retrieve final url")
        }
        let request = NSMutableURLRequest(url: finalUrl)
        request.httpMethod = method.rawValue
        return request
    }
}

enum CountriesApi {
    case Name(name : String)
    case AlphaCodes(codes : [String])
}
extension CountriesApi : Resource{
    var path: String {
        switch self {
        case let .Name(name):
            return "name/\(name)"
        case .AlphaCodes:
            return "alpha"

        }
    }
    
    var parameters: [String : String] {
        switch self {
        case .Name:
            return ["fullText": "true"]
        case let .AlphaCodes(codes):
            return ["codes": codes.joined(separator: ";")]
        }
       
    }
    
    
}
