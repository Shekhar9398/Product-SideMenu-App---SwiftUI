

import SwiftUI

class CartViewModel : ObservableObject {
    
    @Published var cartItems : [ProductData] = []
    
    //adding Item to cart(List)
    func addProductToCart(product: ProductData ){
        cartItems.append(product)
    }   
    
    //Perform Delete on swipe
    func performDelete(offsets : IndexSet){
        cartItems.remove(atOffsets: offsets)
    }
}
