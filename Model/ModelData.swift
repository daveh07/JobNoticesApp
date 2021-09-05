//
//  ModelData.swift
//  JobStation
//
//  Created by David on 5/9/21.
//

import SwiftUI

struct cardModel: Identifiable {
    var id = UUID().uuidString
    var image: String
    var title: String

}

var cards = [
    
    cardModel(id: "notice1", image: "image1", title: "Notice 1")
]


var ScrollTabs = ["TODAY", "WEEKLY", "MONTHLY", "GENERAL"]


