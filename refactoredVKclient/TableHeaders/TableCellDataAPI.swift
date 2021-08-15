//
//  TableCellDataAPI.swift
//  refactoredVKclient
//
//  Created by mac on 11.07.2021.
//

import Foundation
import UIKit

struct UsersHeaderSection {
    let letter: String
    var tableCell: [User]
}
struct GroupsHeaderSection {
    let letter: String
    var tableCell: [Group]
}

    
func sortByName(users: [User]) -> [UsersHeaderSection] {
    let str = "АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЬЭЮЯABCDEFGHIJKLMNOPQRSTUVWXYZ"
    var sorted = [User]()
    var headerSectionSorted = [UsersHeaderSection]()
    
      for i : Int in 0 ..< (str.count) {
        sorted = []
        let index = str.index(str.startIndex, offsetBy: i)
        let letter = str[index]
        for j : Int in 0 ..< users.count {
              let name = users[j]
            let upperName = name.lastName.uppercased()
            if upperName.first == letter {
                  sorted.append(name)
              }
          }
        if sorted.count > 0{
            let headerElement = UsersHeaderSection(letter: String(letter), tableCell: sorted)
            headerSectionSorted.append(headerElement)
        }
       }
    
    return headerSectionSorted
}

func sortByName(groups: [Group]) -> [GroupsHeaderSection] {
    let str = "АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЬЭЮЯABCDEFGHIJKLMNOPQRSTUVWXYZ"
    var sorted = [Group]()
    var headerSectionSorted = [GroupsHeaderSection]()
    
      for i : Int in 0 ..< (str.count) {
        sorted = []
        let index = str.index(str.startIndex, offsetBy: i)
        let letter = str[index]
        for j : Int in 0 ..< groups.count {
            let name = groups[j]
            let upperName = name.name.uppercased()
            if upperName.first == letter {
                sorted.append(name)
              }
          }
        if sorted.count > 0{
            let headerElement = GroupsHeaderSection(letter: String(letter), tableCell: sorted)
            headerSectionSorted.append(headerElement)
        }
       }
    
    return headerSectionSorted
}
func separateCellsAndHeaderSections(users: [UsersHeaderSection]) -> [User]{
    var tableCellData: [User] = []
    for item in users {
        for tableCell in item.tableCell {
            tableCellData.append(tableCell)
        }
    }
    return tableCellData
}

func separateCellsAndHeaderSections(groups: [GroupsHeaderSection]) -> [Group]{
    var tableCellData: [Group] = []
    for item in groups {
        for tableCell in item.tableCell {
            tableCellData.append(tableCell)
        }
    }
    return tableCellData
}

