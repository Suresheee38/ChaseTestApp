//
//  SchoolList.swift
//  02122023-SureshVijay-NYCSchools
//
//  Created by Suresh kumar Vijayakumar on 2/11/23.
//

import Foundation

// MARK: - NYCSchoolList
struct NYCSchool: Codable {
    let dbn: String?
    let schoolName: String?
    let boro: String?
    let overview_paragraph: String?
    let academicopportunities1: String?
    let academicopportunities2: String?
    let ell_programs: String?
    let neighborhood: String?
    let building_code: String?
    let location: String?
    let phone_number: String?
    let fax_number: String?
    let school_email: String?
    let website: String?
    let subway: String?
    let bus: String?
    let grades2018: String?
    let finalgrades: String?
    let total_students: String?
    let extracurricular_activities: String?
    let school_sports: String?
    let attendance_rate: String?
    let pct_stu_enough_variety: String?
    let pct_stu_safe: String?
    let school_accessibility_description: String?
    let directions1: String?
    let requirement1_1: String?
    let requirement2_1: String?
    let requirement3_1: String?
    let requirement4_1: String?
    let requirement5_1: String?
    let offer_rate1: String?
    let program1: String?
    let code1: String?
    let interest1: String?
    let method1: String?
    let seats9ge1: String?
    let grade9gefilledflag1: String?
    let grade9geapplicants1: String?
    let seats9swd1: String?
    let grade9swdfilledflag1: String?
    let grade9swdapplicants1: String?
    let seats101: String?
    let admissionspriority11: String?
    let admissionspriority21: String?
    let admissionspriority31: String?
    let grade9geapplicantsperseat1: String?
    let grade9swdapplicantsperseat1: String?
    let primary_address_line_1: String?
    let city: String?
    let zip: String?
    let state_code: String?
    let latitude: String?
    let longitude: String?
    let community_board: String?
    let council_district: String?
    let census_tract: String?
    let bin: String?
    let bbl: String?
    let nta: String?
    let borough: String?
    
    enum CodingKeys: String, CodingKey {
        case dbn
        case schoolName = "school_name"
        case boro
        case overview_paragraph
        case academicopportunities1
        case academicopportunities2
        case ell_programs
        case neighborhood
        case building_code
        case location
        case phone_number
        case fax_number
        case school_email
        case website
        case subway
        case bus
        case grades2018
        case finalgrades
        case total_students
        case extracurricular_activities
        case school_sports
        case attendance_rate
        case pct_stu_enough_variety
        case pct_stu_safe
        case school_accessibility_description
        case directions1
        case requirement1_1
        case requirement2_1
        case requirement3_1
        case requirement4_1
        case requirement5_1
        case offer_rate1
        case program1
        case code1
        case interest1
        case method1
        case seats9ge1
        case grade9gefilledflag1
        case grade9geapplicants1
        case seats9swd1
        case grade9swdfilledflag1
        case grade9swdapplicants1
        case seats101
        case admissionspriority11
        case admissionspriority21
        case admissionspriority31
        case grade9geapplicantsperseat1
        case grade9swdapplicantsperseat1
        case primary_address_line_1
        case city
        case zip
        case state_code
        case latitude
        case longitude
        case community_board
        case council_district
        case census_tract
        case bin
        case bbl
        case nta
        case borough
    }
}

typealias NYCSchoolList = [NYCSchool]

// MARK: - WelcomeElement
struct NYCSchoolDetail: Codable {
    let dbn: String?
    let schoolName: String?
    let numOfSatTestTakers: String?
    let satCriticalReadingAvgScore: String?
    let satMathAvgScore: String?
    let satWritingAvgScore: String?

    enum CodingKeys: String, CodingKey {
        case dbn
        case schoolName = "school_name"
        case numOfSatTestTakers = "num_of_sat_test_takers"
        case satCriticalReadingAvgScore = "sat_critical_reading_avg_score"
        case satMathAvgScore = "sat_math_avg_score"
        case satWritingAvgScore = "sat_writing_avg_score"
    }
}

typealias NYCSchoolDetails = [NYCSchoolDetail]
