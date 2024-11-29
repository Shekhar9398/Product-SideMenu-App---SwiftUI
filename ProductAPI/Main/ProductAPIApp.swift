
import SwiftUI

@main
struct ProductAPIApp: App {

    @StateObject var cartViewModel : CartViewModel = CartViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomepageView()
                .environmentObject(cartViewModel)
        }
    }
}
