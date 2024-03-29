//
// CharacterAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
import Alamofire



open class CharacterAPI {
    /**
     Character list
     
     - parameter page: (query) The page number of objects to return. Defaults to 0. (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func charactersGet(page: Int? = nil, completion: @escaping ((_ data: CharacterList?,_ error: Error?) -> Void)) {
        charactersGetWithRequestBuilder(page: page).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }

    /**
     Character list
     - GET /character/
     - parameter page: (query) The page number of objects to return. Defaults to 0. (optional)
     - returns: RequestBuilder<CharacterList> 
     */
    open class func charactersGetWithRequestBuilder(page: Int? = nil) -> RequestBuilder<CharacterList> {
        let path = "/character/"
        let URLString = OpenAPIClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
            "page": page?.encodeToJSON()
        ])

        let requestBuilder: RequestBuilder<CharacterList>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

}
