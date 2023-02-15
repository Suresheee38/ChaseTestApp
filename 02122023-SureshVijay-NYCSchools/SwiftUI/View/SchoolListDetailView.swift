//
//  SchoolListDetailView.swift
//  02122023-SureshVijay-NYCSchools
//
//  Created by Suresh kumar Vijayakumar on 2/13/23.
//

import SwiftUI

/// SWIFT UI View for detail page
struct SchoolListDetailView: View {
    @StateObject var viewModel: NYCSchoolDetailViewModel
    @State var show: Bool
    
    var body: some View {
        VStack {
            List {
                ForEach(Detail.allCases) { type in
                    Section(content: {
                        ForEach(unwrappedDict(type: type).sorted(by: >), id: \.key) { (key, value) in
                            HStack(spacing: 0) {
                                Text(key)
                                    .frame(maxWidth: .infinity)
                                Text(value)
                                    .frame(maxWidth: .infinity)
                            }
                        }
                        .padding(8.0)
                    }, header: {
                        Text(titleUnwrapped(type: type))
                    })
                }
            }
        }
        .navigationBarTitle(viewModel.title)
    }
    
    func unwrappedDict(type: Detail) -> [String: String] {
        return viewModel.getDetailData(for: type)?.keyAndValues ?? [:]
    }
    
    func titleUnwrapped(type: Detail) -> String {
        return viewModel.getDetailData(for: type)?.title ?? ""
    }
}
