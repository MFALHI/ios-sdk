/**
 * Copyright IBM Corporation 2015
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 **/

import Foundation
import ObjectMapper

extension ToneAnalyzer {
    
    /*internal struct ToneAnalyzerError: JSONEncodable, JSONDecodable {
        var description: String?
        var error: String?
        var code: Int?
        
        init(json: JSON) throws {
            description = try? json.string("description")
            error = try? json.string("error")
            code = try? json.int("code")
        }
        
        func toJSON() -> JSON {
            var json = [String: JSON]()
            if let description = description { json["description"] = .String(description) }
            if let error = error { json["error"] = .String(error) }
            if let code = code { json["code"] = .Int(code) }
            return JSON.Dictionary(json)
        }
    }*/
    
    
    internal struct ToneAnalyzerError: WatsonError {
        var description: String!
        var error: String!
        var code: Int!
        
        var nsError: NSError {
            let domain = Constants.errorDomain
            let userInfo = [NSLocalizedDescriptionKey: error,
                            NSLocalizedRecoverySuggestionErrorKey: description]
            return NSError(domain: domain, code: code, userInfo: userInfo)
        }
        
        init() {}
        
        init?(_ map: Map) {}
        
        mutating func mapping(map: Map) {
            description <- map["description"]
            error       <- map["error"]
            code        <- map["code"]
        }
    }
}