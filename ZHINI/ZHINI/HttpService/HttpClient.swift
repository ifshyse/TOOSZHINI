//
//  HttpClient.swift
//  HttpClientDemo
//
//  Created by Stephen on 2018/5/23.
//  Copyright © 2018年 Stephen. All rights reserved.
//

import UIKit
import Alamofire

class HttpClient: NSObject {
    static let httpClient = HttpClient()
    
    private override init() {
        // 单例模式，防止出现多个实例
    }
    
    func getRequestWithURL(url :String,parameter:[String: AnyObject]?, success: @escaping (_ result: [String: AnyObject]) -> Void ,failure: @escaping (_ error: Error) -> Void ) -> Void {
        request(url: url, method: HTTPMethod.get, parameters: parameter, complection:success , failure: failure)
    }
    
    func postRequestWithURL(url :String,parameter:[String: AnyObject]?, complection: @escaping (_ result: [String: AnyObject]) -> Void,failure: @escaping (_ error: Error) -> Void  ) -> Void {
        request(url: url, method: HTTPMethod.post, parameters: parameter, complection:complection , failure: failure)
    }
    
    private func request(url:String, method:HTTPMethod, parameters:[String: AnyObject]?, complection: @escaping (_ result: [String: AnyObject]) -> Void,failure: @escaping (_ error: Error) -> Void  ) -> Void {
        
        Alamofire.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default)
            .downloadProgress(queue:DispatchQueue.global(qos: .utility)) { progress in
                print("Progress: \\(progress.fractionCompleted)")
            }
            .validate { request, response, data in
                guard data != nil else {
                    let err = 93 as! Error
                    return .failure(err)
                }
                let retCode = response.statusCode
                if retCode > 300 {
                    return .failure(response.statusCode as! Error)
                }
                return .success
            }
            .responseJSON { response in
                debugPrint(response)
                
                if response.error != nil {
                    failure(response.error!)
                    return;
                }
                
                if let JSON = response.result.value {
                    complection(JSON as! [String: AnyObject])
                }
                return;
        }
    }
}
