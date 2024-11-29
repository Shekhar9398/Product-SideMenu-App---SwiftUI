import Foundation
import Combine

class ProductViewModel: ObservableObject {
    
    @Published var productResponse : [ProductResponse] = [] //[Product(Struct)] array for getting data and Sharing to View
    
    @Published var products : [ProductData] = []
    
    func fetchProduct(){
        //Call Fetch Data generic funtion from Network Manager Class
        NetworkManager.shared.fetchData(from : "https://fakestoreapi.com/products", modelType: [ProductResponse].self) { result in
            
            //Mapping Data with our Model
            DispatchQueue.main.async { [self] in
                switch result {
                case .success(let products):
                    //Product Response Model
                    self.productResponse = products 
                    
                    //ProductData Model
                    self.products = productResponse.compactMap({ product in
                        product.passDataToProductData()
                    })
                    
                case .failure(let error):
                    debugPrint(error.localizedDescription)
                    
                }
            }
        }
    }
    
}
