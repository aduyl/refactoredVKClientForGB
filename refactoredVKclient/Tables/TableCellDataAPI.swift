//
//  TableCellDataAPI.swift
//  refactoredVKclient
//
//  Created by mac on 11.07.2021.
//

import Foundation
import UIKit

struct headerSection {
    let letter: String
    let tableCell: [tableCellDataClass]
}


class TableCellDataAPI {
    static func getUsersGroupCellData(user: tableCellDataClass, array: [tableCellDataClass]) -> [tableCellDataClass]{
        var newArray = array
        newArray.append(user)
        return newArray
    }
    static func getGroupCellData() -> [headerSection]{
        let tableCellDataArray = [
            tableCellDataClass(avatar: UIImage(imageLiteralResourceName: "cats"), name: "cats", itemPropeties: "All about cats", usersPhotos: []),
            tableCellDataClass(avatar: UIImage(imageLiteralResourceName: "hurts"), name: "hurts", itemPropeties: "All the broken-hearted", usersPhotos: []),
            tableCellDataClass(avatar: UIImage(imageLiteralResourceName: "killua"), name: "killua", itemPropeties: "Best boi", usersPhotos: []),
            tableCellDataClass(avatar: UIImage(imageLiteralResourceName: "home"), name: "home", itemPropeties: "For your dream house", usersPhotos: []),
            tableCellDataClass(avatar: UIImage(imageLiteralResourceName: "acid"), name: "acid", itemPropeties: " ", usersPhotos: [])
        ]
        let array = sortByName(array: tableCellDataArray)
        return array
    }
    static func getUsersCellData() -> [headerSection]{
        let tableCellDataArray = [
            tableCellDataClass(avatar: UIImage(imageLiteralResourceName: "Ангелина Данилова"), name: "Ангелина Данилова", itemPropeties: "23 years old", usersPhotos: [UIImage(imageLiteralResourceName: "Ангелина Данилова1"), UIImage(imageLiteralResourceName: "Ангелина Данилова2"),UIImage(imageLiteralResourceName: "Ангелина Данилова3"),UIImage(imageLiteralResourceName: "Ангелина Данилова4"),UIImage(imageLiteralResourceName: "Ангелина Данилова5")]),
            tableCellDataClass(avatar: UIImage(imageLiteralResourceName: "AK LiuZhang"), name: "AK LiuZhang", itemPropeties: "19 years old", usersPhotos: [UIImage(imageLiteralResourceName: "AK LiuZhang1"), UIImage(imageLiteralResourceName: "AK LiuZhang2"),UIImage(imageLiteralResourceName: "AK LiuZhang3"),UIImage(imageLiteralResourceName: "AK LiuZhang4"),UIImage(imageLiteralResourceName: "AK LiuZhang5")]),
            tableCellDataClass(avatar: UIImage(imageLiteralResourceName: "Li Laoshi"), name: "Li Laoshi", itemPropeties: "27 years old", usersPhotos: [UIImage(imageLiteralResourceName: "Li Laoshi1"), UIImage(imageLiteralResourceName: "Li Laoshi2"),UIImage(imageLiteralResourceName: "Li Laoshi3"),UIImage(imageLiteralResourceName: "Li Laoshi4"),UIImage(imageLiteralResourceName: "Li Laoshi5")]),
            tableCellDataClass(avatar: UIImage(imageLiteralResourceName: "Mika"), name: "Mika", itemPropeties: "21 years old", usersPhotos: [UIImage(imageLiteralResourceName: "Mika1"), UIImage(imageLiteralResourceName: "Mika2"),UIImage(imageLiteralResourceName: "Mika3"),UIImage(imageLiteralResourceName: "Mika4"),UIImage(imageLiteralResourceName: "Mika5")]),
            tableCellDataClass(avatar: UIImage(imageLiteralResourceName: "Zhou Keyu"), name: "Zhou Keyu", itemPropeties: " 18 years old", usersPhotos: [UIImage(imageLiteralResourceName: "Zhou Keyu1"), UIImage(imageLiteralResourceName: "Zhou Keyu2"),UIImage(imageLiteralResourceName: "Zhou Keyu3"),UIImage(imageLiteralResourceName: "Zhou Keyu4"),UIImage(imageLiteralResourceName: "Zhou Keyu5")])
        ]
        let array = sortByName(array: tableCellDataArray)
        
        return array
    }
}
func sortByName(array: [tableCellDataClass]) -> [headerSection] {
    let str = "ABCDEFGHIJKLMNOPQRSTUVWXYZАБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЬЭЮЯ"
    var sortedArray = [tableCellDataClass]()
    var mainSortedArray = [headerSection]()
      for i : Int in 0 ..< (str.count) {
        sortedArray = []
        let index = str.index(str.startIndex, offsetBy: i)
        let letter = str[index]
        for j : Int in 0 ..< array.count {
              let name = array[j]
            let upperName = name.name?.uppercased()
            if upperName?.first == letter {
                  sortedArray.append(name)
              }
          }
        if sortedArray.count > 0{
            let headerElement = headerSection(letter: String(letter), tableCell: sortedArray)
            mainSortedArray.append(headerElement)
        }
       
       }
    return mainSortedArray
}

//func makeDict(array: [tableCellDataClass]) -> [Character: [tableCellDataClass]] {
//    let str = "ABCDEFGHIJKLMNOPQRSTUVWXYZАБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЬЭЮЯ"
//    var result = [Character: [tableCellDataClass]]()
//    for letter in str{
//        let strLetter = String(letter)
//        result[letter] = []
//        let matches = array.filter({($0.name?.hasPrefix(strLetter))!})
//        if !matches.isEmpty{
//            for element in array{
//                result[letter]?.append(element)
//            }
//        }
//    }
//    return result
//}
