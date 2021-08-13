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
    var tableCell: [Users]
}
struct GroupsHeaderSection {
    let letter: String
    var tableCell: [Groups]
}

    
func sortByName(usersArray: [Users]) -> [UsersHeaderSection] {
    let str = "АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЬЭЮЯABCDEFGHIJKLMNOPQRSTUVWXYZ"
    var sortedArray = [Users]()
    var mainSortedArray = [UsersHeaderSection]()
    
      for i : Int in 0 ..< (str.count) {
        sortedArray = []
        let index = str.index(str.startIndex, offsetBy: i)
        let letter = str[index]
        for j : Int in 0 ..< usersArray.count {
              let name = usersArray[j]
            let upperName = name.lastName.uppercased()
            if upperName.first == letter {
                  sortedArray.append(name)
              }
          }
        if sortedArray.count > 0{
            let headerElement = UsersHeaderSection(letter: String(letter), tableCell: sortedArray)
            mainSortedArray.append(headerElement)
        }
       }
    
    return mainSortedArray
}

func sortByName(groupsArray: [Groups]) -> [GroupsHeaderSection] {
    let str = "АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЬЭЮЯABCDEFGHIJKLMNOPQRSTUVWXYZ"
    var sortedArray = [Groups]()
    var mainSortedArray = [GroupsHeaderSection]()
    
      for i : Int in 0 ..< (str.count) {
        sortedArray = []
        let index = str.index(str.startIndex, offsetBy: i)
        let letter = str[index]
        for j : Int in 0 ..< groupsArray.count {
            let name = groupsArray[j]
            let upperName = name.name.uppercased()
            if upperName.first == letter {
                sortedArray.append(name)
              }
          }
        if sortedArray.count > 0{
            let headerElement = GroupsHeaderSection(letter: String(letter), tableCell: sortedArray)
            mainSortedArray.append(headerElement)
        }
       }
    
    return mainSortedArray
}
func separateCellsAndHeaderSections(usersArray: [UsersHeaderSection]) -> [Users]{
    var tableCellArray: [Users] = []
    for item in usersArray {
        for tableCell in item.tableCell {
            tableCellArray.append(tableCell)
        }
    }
    return tableCellArray
}

func separateCellsAndHeaderSections(groupsArray: [GroupsHeaderSection]) -> [Groups]{
    var tableCellArray: [Groups] = []
    for item in groupsArray {
        for tableCell in item.tableCell {
            tableCellArray.append(tableCell)
        }
    }
    return tableCellArray
}
