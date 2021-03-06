//
//  Realm+JSON.swift
//  RealmSwift
//
//  Created by KimChangsung on 2/11/16.
//  Copyright © 2016 Changsung. All rights reserved.
//

import RealmSwift

extension Realm {
    func create<T : RealmSwift.Object>(type: T.Type, jsonDictionary: [String:AnyObject], update: Bool = true) -> T {
        return create(type, value: T.createJSONObjectFromJSONDictionary(jsonDictionary), update: update)
    }
    
    func create<T : RealmSwift.Object>(type: T.Type, jsonDictioanryArray: [[String:AnyObject]], update: Bool = true) -> [T] {
        var results = [T]()
        for item in jsonDictioanryArray {
            results.append(create(type, jsonDictionary: item, update: update))
        }
        return results
    }
}