//
//  SaveData.swift
//  refactoredVKclient
//
//  Created by mac on 21.08.2021.
//

import Foundation
import RealmSwift

final class SaveData {
    var network = NetworkLayer()
    
    public func getData() {
        getUsersData()
        getGroupData()
    }
    
    private func getUsersData() {
        network.downloadUsers {[weak self] result in
            guard let self = self else { return }
            switch result {
            case .failure(let error) :
                print(error) 
            case .success(let data) :
                self.save(data)
            }
        }
    }
    
     private func getGroupData() {
        network.downloadGroups {[weak self] result in
            guard let self = self else { return }
            switch result {
            case .failure(let error) :
                print(error)
            case .success(let data) :
                self.save(data)
            }
        }
    }
    
    
    private func save<T: Object>(_ data: [T]) {
        do {
            let realm = try Realm()
            let oldData = realm.objects(T.self)
            realm.beginWrite()
            realm.delete(oldData)
            realm.add(data)
            try realm.commitWrite()
        } catch {
            print(error)
        }
    }
}
