//
//  MultipleChoiceResponseModel.swift
//  GuideBlocks
//
//  Created by Marc Stroebel on 31/3/2023.
//  Copyright © 2024 GuideBlocks.
//

import Foundation
import Combine

class MultipleChoiceResponseModel : ObservableObject, Codable {
    let text : String
    let uuid : UUID
    var selected = false
    
    let allowsCustomTextEntry : Bool
    var customTextEntry: String? = nil
    
    init(_ text : String, allowsCustomTextEntry : Bool = false) {
        self.text = text
        self.uuid = UUID()
        self.allowsCustomTextEntry = allowsCustomTextEntry
    }
}
