import Foundation
import SwiftUI

//ResponseModel for Product

struct ProductResponse: Codable, Identifiable {
    let id: Int?
    let title: String?
    let price: Double?
    let description: String?
    let category: String?
    let image: String?
    let rating: Rating?
    
    struct Rating: Codable{
        let rate: Double?
        let count: Int?
    }
}
