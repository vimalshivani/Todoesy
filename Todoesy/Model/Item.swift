//
//  Item.swift
//  Todoesy
//
//  Created by Kumar, Vimal on 23/11/18.
//  Copyright © 2018 Kumar, Vimal. All rights reserved.
//

import Foundation

import RealmSwift


class Item  : Object {
    
    
    @objc dynamic var name : String = ""
    @objc dynamic var status : Bool   = false
}
