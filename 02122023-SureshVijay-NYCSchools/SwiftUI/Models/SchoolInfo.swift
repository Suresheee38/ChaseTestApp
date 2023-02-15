//
//  SchoolInfo.swift
//  02122023-SureshVijay-NYCSchools
//
//  Created by Suresh kumar Vijayakumar on 2/14/23.
//

import Foundation

struct SchoolInfo: Detailing  {
    private enum Constants {
        static let schoolInfoTitle = "School Info"
        static let schoolNameTitle = "School Name"
        static let totalStudent = "Total Students"
        static let city = "City"
        static let website = "Website"
        static let none = "None"
    }
    
    private let nycSchool: NYCSchool?
        
    var title: String {
        return Constants.schoolInfoTitle
    }
    
    var keyAndValues: [String: String] {
        //set to none if no school details available
        guard let nycSchool = nycSchool else {
            return [Constants.schoolInfoTitle: Constants.none]
        }
        return [
            Constants.schoolNameTitle: nycSchool.schoolName ?? "",
            Constants.totalStudent: nycSchool.total_students ?? "",
            Constants.city: nycSchool.city ?? "",
            Constants.website: nycSchool.website ?? ""
        ]
    }
    
    init?(nycSchool: NYCSchool?) {
        self.nycSchool = nycSchool
    }
 }
