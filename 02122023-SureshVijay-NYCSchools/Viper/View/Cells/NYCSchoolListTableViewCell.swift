//
//  NYCSchoolListTableViewCell.swift
//  02122023-SureshVijay-NYCSchools
//
//  Created by Suresh kumar Vijayakumar on 2/11/23.
//

import UIKit

// Generic type
protocol CellViewModel {
    associatedtype Model
    func setUpWithModel(
        nycSchoolList: NYCSchoolList?,
        indexpath: IndexPath
    )
}

class NYCSchoolListTableViewCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var city: UILabel!
}

extension NYCSchoolListTableViewCell: CellViewModel {
    typealias Model = NYCSchool
    
    func setUpWithModel(
        nycSchoolList: NYCSchoolList?,
        indexpath: IndexPath
    ) {
        guard let nycSchoolList = nycSchoolList, !nycSchoolList.isEmpty else {
            return
        }
        name.text = nycSchoolList[indexpath.row].schoolName
        address.text = nycSchoolList[indexpath.row].primary_address_line_1
        city.text = nycSchoolList[indexpath.row].city
    }
}
