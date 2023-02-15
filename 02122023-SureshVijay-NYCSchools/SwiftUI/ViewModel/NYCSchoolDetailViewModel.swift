//
//  NYCSchoolDetailViewModel.swift
//  02122023-SureshVijay-NYCSchools
//
//  Created by Suresh kumar Vijayakumar on 2/14/23.
//

import Foundation

protocol NYCSchoolDetailViewModeling {
    func getDetailData(for type: Detail) -> Detailing?
    func fetchDetail(for dbn: String, completion: @escaping (NYCSchoolDetail?) -> ())
}

///Types impelments this protocol can be added in detail page
protocol Detailing {
    var title: String { get }
    var keyAndValues: [String: String] { get }
}

/// Detail type
/// Can add more types to show multiple sections
/// sat scores and school info has showin in detail page as of now
/// can be extended
enum Detail: CaseIterable, Identifiable {
    case sat
    case schoolInfo
    
    var id: Self {
        return self
    }
}

///
///View model handling network requests and other logics to update view
///
class NYCSchoolDetailViewModel: NYCSchoolDetailViewModeling, ObservableObject {
    @Published var schoolDetail: NYCSchoolDetail?
    private let nycSchool: NYCSchool?
    private let networkManaging: NetworkManaging

    init(
        nycShcool: NYCSchool?,
        networkManaging: NetworkManaging = NetworkManager(apiExecutor: APIExecuter())
    ) {
        self.nycSchool = nycShcool
        self.networkManaging = networkManaging
        guard let dbn = nycShcool?.dbn else { return }
        fetchDetail(for: dbn) { detail in
            self.schoolDetail = detail
        }
    }
    
    ///sat score - Detailing type
    ///school info - Detailing type
    func getDetailData(for type: Detail) -> Detailing? {
        switch type {
        case .sat:
            return SatInfo(nycSchoolDetail: schoolDetail)
        case .schoolInfo:
            return SchoolInfo(nycSchool: nycSchool)
        }
    }
    
    /// fetch detail for dbn
    func fetchDetail(for dbn: String, completion: @escaping (NYCSchoolDetail?) -> ()) {
        networkManaging.fetchDetail(dbn: dbn) { res in
            let detail = try? res.get().first
            completion(detail)
        }
    }
    
    ///Navigation title
    var title: String {
        return nycSchool?.schoolName ?? ""
    }
}
