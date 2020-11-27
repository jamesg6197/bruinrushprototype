//
//  ReviewsViewModel.swift
//  bruinlabs
//
//  Created by Daniel Hu on 7/26/20.
//  Copyright © 2020 Daniel Hu. All rights reserved.
//

import Foundation
import FirebaseFirestore

class ReviewsViewModel: ObservableObject {
    @Published var reviews = [completedReviews]()
    
    private var db = Firestore.firestore()
    
    func fetchData(org: String){
        db.collection("\(org) reviews").addSnapshotListener{(QuerySnapshot, error) in
            guard let documents = QuerySnapshot?.documents else{
                print("No documents")
                return
            }
            
            self.reviews = documents.map{ (QueryDocumentSnapshot) -> completedReviews in
                let data = QueryDocumentSnapshot.data()
                
                let name = data["name"] as? String ?? ""
                let review = data["review"] as? String ?? ""
                return completedReviews(sName: name, sReview: review)
                //return completedReviews(sReview: review)
            }
        }
    }
}
