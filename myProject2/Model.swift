//
//  Model.swift
//  myProject2
//
//  Created by Haya on 26/03/1443 AH.
//

import Foundation
import UIKit

struct Flower {
    var title : String
    var info: String
    var photo : UIImage?
}

class Store {
    var products : [Flower] = []
}
