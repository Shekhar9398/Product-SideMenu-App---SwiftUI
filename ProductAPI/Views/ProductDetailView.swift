
import SwiftUI

struct ProductDetailView: View {
    
    let product : ProductData
    
    @State private var isAddedToCart = false
    @EnvironmentObject var cartViewModel: CartViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            if let url = URL(string: product.image){
                
                AsyncImage(url: url){ productDetailImage in
                    
                    productDetailImage
                        .resizable()
                        .frame(width: 300, height: 300)
                        .padding()
                    
                }placeholder: {
                    ProgressView()
                }
                
            }
            
            VStack(alignment: .leading) {
                Text("Description:")
                    .font(.custom("monasans", size: 20))
                    .fontWeight(.bold)
                
                Text(product.description)
                    .font(.custom("monasans", size: 16))
                    .padding()
            }
            
            Button("Add to Cart"){
                isAddedToCart = true
                cartViewModel.addProductToCart(product: product)
                
            }
            .buttonStyle(.borderedProminent)
            .padding(.leading, 120)
            .alert(isPresented: $isAddedToCart, content: {
                Alert(title: Text("Product has been added to cart"))
            })
            
            Spacer()
        }
        .navigationTitle(product.title)
        .padding()
        .toolbarRole(.editor)
    }
}

#Preview {
    NavigationStack {
        ProductDetailView(product:
                            ProductData(
                                id: 10,
                                title: "Bag", price: 30, description: " HandBag: Details...",
                                image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg"
                            )
        )
        .environmentObject(CartViewModel())
    }
}
