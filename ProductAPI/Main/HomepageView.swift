
import SwiftUI

struct HomepageView: View {
    
    @EnvironmentObject var cartViewModel: CartViewModel
    
    var body: some View {
        
        //HomePage Menu's
        TabView {
            //Menu
            ProductView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            //Cart
            CartView()
                .environmentObject(cartViewModel)
                .tabItem {
                    Label("Cart", systemImage: "cart")
                }
        }
        .accentColor(.black)
    }
}

#Preview {
    HomepageView()
        .environmentObject(CartViewModel())
}



