import Foundation
import SwiftUI

//DataModel for Product
struct ProductData:Identifiable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let image: String
}


extension ProductResponse {
    func passDataToProductData() -> ProductData {
        let id = id ?? 10
        let title = title  ?? "Title"
        let price = price ?? 20.5
        let description = description ?? "Description"
        let image = image ?? "imageUrl"

        return ProductData(id: id, title: title, price: price, description: description, image: image)
    }
}
