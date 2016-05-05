/**
 * Copyright IBM Corporation 2016
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
import Freddy

extension NaturalLanguageClassifierV1 {
    
    public struct Classification: JSONDecodable {
        
        /// Unique identifier for the classifier used.
        public let classifierId: String
        
        /// Link to the classifier.
        public let url: String
        
        /// The submitted phrase.
        public let text: String
        
        /// The class with the highest confidence.
        public let topClass: String
        
        /// An array classes of up to ten className-confidence pairs that are sorted in descending order of confidence. If there are fewer than 10 classes, the sum of the confidence values is 100%.
        public let classes: [ClassifiedClass]
        
        public init(json: JSON) throws {
            classifierId = try json.string("classifier_id")
            url = try json.string("url")
            text = try json.string("text")
            topClass = try json.string("top_class")
            classes = try json.arrayOf("classes", type: ClassifiedClass.self)
        }
    }
    
    public struct ClassifiedClass: JSONDecodable {
        
        /// A decimal percentage that represents the confidence Watson has in this class. Higher values represent higher confidences.
        public var confidence: Double
        
        /// Class label.
        public var className: String
        
        public init(json: JSON) throws {
            confidence = try json.double("confidence")
            className = try json.string("class_name")
        }
    }
    
}
