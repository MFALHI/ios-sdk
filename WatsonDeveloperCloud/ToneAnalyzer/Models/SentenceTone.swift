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

extension ToneAnalyzer {
    /**
     * This element contains the result of analyzing an individual sentence. 
     * It contains a list of ToneCategory objects which is the actual result, 
     * and also some metadata about the sentence: The original text (if it needs 
     * to be tracked back), and the position of the sentence in the original
     * text (as index of first and last character).
     */
    public struct SentenceTone {
        /// Unique ID for each sentence.
        public var id:Int = 0
        /// The character number of the first character in the sentence.
        public var inputFrom:Int = 0
        /// The character number of the last character in the sentence.
        public var inputTo:Int = 0
        /// Text of the sentence being analyzed.
        public var text:String = ""
        
        init(anyObject: AnyObject) {
            self.id = anyObject["sentence_id"] as! Int
            self.inputFrom = anyObject["input_from"] as! Int
            self.inputTo = anyObject["input_to"] as! Int
            self.text = anyObject["text"] as! String
        }
    }
}
