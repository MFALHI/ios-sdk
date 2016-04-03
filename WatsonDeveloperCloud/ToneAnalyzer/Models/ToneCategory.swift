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
     * Top level tone (or Tone Category) from the list of Writing Tone, 
     * Emotion Tone or Social Tone. It holds a list of scores for individual Tones.
     */
    public struct ToneCategory {
        
        /// The unique ID of the category.
        public var id:String = ""
        
        /// The tone analysis categories. Possible tone categories are emotion, writing, and social.
        public var name:String = ""
        
        /**
          * Analysis organized by tones. The emotion tones are anger, disgust, fear, joy, and sadness.
          * The writing tones are analytical, confident, and tentative. The social tones are
          * openness, conscientiousness, extraversion, agreeableness, and neuroticism.
        **/
        public var tones:[ToneScore] = []
        
        init(anyObject: AnyObject) {
            self.id = anyObject["category_id"] as! String
            self.name = anyObject["category_name"] as! String
            for tone in anyObject["tones"] as! [AnyObject] {
                tones.append(ToneScore.init(anyObject: tone))
            }
        }
    }
}