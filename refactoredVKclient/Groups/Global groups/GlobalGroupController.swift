//
//  GlobalGroupController.swift
//  refactoredVKclient
//
//  Created by mac on 29.07.2021.
//

import UIKit
import Foundation

protocol DataDelegate: AnyObject {
    func transferGroup(group: tableCellDataClass)
}

class GlobalGroupController: UniversalTableController {
    var sentElement: tableCellDataClass?
    weak var delegate: DataDelegate?
    override func getDataArray() {
        self.dataArray = TableCellDataAPI.getGroupCellData()
    }
    override func configureNavigation() {
        let searchBar = UISearchBar(frame: CGRect(x: CGFloat(Double(self.view.frame.width) * 0.1), y: 30, width: CGFloat(Double(self.view.frame.width) * 0.9), height: 44))
        view.addSubview(searchBar)
        let navButton = UIButton(frame: CGRect(x: 0, y:30, width: CGFloat(Double(self.view.frame.width) * 0.1), height: 44))
        navButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        navButton.addTarget(nil, action: #selector(pushNvigationButton), for: .touchUpInside)
        view.addSubview(navButton)
    }
    
    @objc override func pushNvigationButton(){
        navigationController?.popViewController(animated: true)
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath{
        sentElement = dataArray[indexPath.section].tableCell[indexPath.row]
        navigationController?.popViewController(animated: true)
        getGroupFromGlobal(sentElement!)
        return indexPath
    }
    

}

extension GlobalGroupController {
    func getGroupFromGlobal(_ group: tableCellDataClass){
        delegate?.transferGroup(group: group)
    }
}
