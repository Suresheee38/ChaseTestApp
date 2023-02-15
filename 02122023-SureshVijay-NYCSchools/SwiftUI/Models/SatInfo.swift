//
//  SatInfo.swift
//  02122023-SureshVijay-NYCSchools
//
//  Created by Suresh kumar Vijayakumar on 2/14/23.
//

import Foundation

struct SatInfo: Detailing {
    private let nycSchoolDetail: NYCSchoolDetail?
    
    private enum Constants {
        static let satScoreTitle = "Sat Scores"
        static let mathScoreTitle = "Math Score"
        static let readingScoreTitle = "Reading Score"
        static let writingScoreTitle = "Writing Score"
        static let details = "Details"
        static let none = "None"
    }
    
    var title: String {
        return Constants.satScoreTitle
    }
    
    var keyAndValues: [String: String] {
        guard let nycSchoolDetail = nycSchoolDetail else {
            return [Constants.details: Constants.none]
        }
        return [
            Constants.mathScoreTitle: nycSchoolDetail.satMathAvgScore ?? "",
            Constants.readingScoreTitle: nycSchoolDetail.satCriticalReadingAvgScore ?? "",
            Constants.writingScoreTitle: nycSchoolDetail.satWritingAvgScore  ?? ""
        ]
    }

    init?(nycSchoolDetail: NYCSchoolDetail?) {
        self.nycSchoolDetail = nycSchoolDetail
    }
 }
