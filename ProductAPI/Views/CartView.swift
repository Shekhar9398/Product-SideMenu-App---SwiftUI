
import SwiftUI

struct CartView: View {
    
    @EnvironmentObject var cartViewModel: CartViewModel
    
    var body: some View {
        
        NavigationStack {
            
            Form{
                ForEach(cartViewModel.cartItems) {item in
                    
                    let imageUrl = item.image
                    
                    HStack{
                        AsyncImage(url: URL(string: imageUrl)) {cartImage in
                            
                            cartImage
                                .resizable()
                                .frame(width: 50, height: 50)
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                            
                        }placeholder: {
                            ProgressView()
                        }
                        .padding()
                        
                        Text(item.title)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                    }
                }
                .onDelete(perform: { indexSet in
                    cartViewModel.performDelete(offsets: indexSet)
                })
                
            }
            .toolbar{
                ToolbarItem(placement: .principal){
                    Text("Your Cart")
                        .font(.custom("Verdana", size: 24))
                }
            }
            .toolbar {
                EditButton()
                    .font(.custom("Verdana", size: 20))
                    .foregroundColor(.red)
            }
            
            
            
        }
    }
    
}

#Preview {
    CartView()
        .environmentObject(CartViewModel()
        )
}
