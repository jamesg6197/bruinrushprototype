//
//  Catalog.swift
//  bruinlabs
//
//  Created by James Guo on 11/26/20.
//  Copyright © 2020 Daniel Hu. All rights reserved.
//
import SwiftUI
import Foundation
struct Organization
{
    let id = UUID()
    let name : String
    let imagelink: String

    
}
struct OrganizationType
{
    let id = UUID()
    let tname : String
    let timagelink: String
    
}

extension Organization
{
    static func getallTypes() -> [Organization] {
        return [Organization(name: "Greek Life", imagelink: "greeklife"),
                Organization(name: "Organizations" , imagelink: "organization"),
                Organization(name: "Incubator Companies", imagelink: "incubator")]
    }
}


struct OrganizationCell: View
{
    let organization: Organization
    var body: some View
    {
        HStack{
            Image(organization.imagelink)
                .resizable()
                .frame(width: UIScreen.main.bounds.width * 0.25, height: UIScreen.main.bounds.width * 0.25)
                .cornerRadius(15)
            Text(organization.name)
                .bold()
                .font(.headline)
            
        }
        .padding()
        
    }
}

