import SwiftUI

struct ProductView: View {
    
    @StateObject var viewModel = ProductViewModel() // For accepting Shared Data
    
    let columns = [
        GridItem(.adaptive(minimum: 150)),
        GridItem(.adaptive(minimum: 150))
        // Adaptive layout for responsiveness
    ]
    
    @State private var showSideMenu = false
    @State private var internetMonitor = InternetMonitor()

    
    var body: some View {
        ZStack {
            NavigationStack {
                
                //If Internet is disconnected
                if !internetMonitor.isConnected {
                    VStack {
                        Spacer()
                        Label("No Internet", systemImage: "wifi")
                    }
                }
                //If Internet is connected
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 12) {
                        ForEach(viewModel.products) { product in
                            NavigationLink(destination: ProductDetailView(product: product)) {
                                VStack {
                                    if let url = URL(string: product.image) {
                                        AsyncImage(url: url) { productImage in
                                            
                                            //Product Image
                                            productImage
                                                .resizable()
                                                .frame(width: 150, height: 150)
                                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                        } placeholder: {
                                            ProgressView()
                                        }
                                    }
                                    
                                    //Product Title
                                    Text("Product: \(product.title)")
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.primary)
                                        .multilineTextAlignment(.center)
                                        .lineLimit(2)
                                        .padding([.top, .horizontal], 5)
                                }
                                .background(RoundedRectangle(cornerRadius: 12).fill(Color(.secondarySystemBackground)))
                                .padding(.bottom, 10)
                            }
                        }
                    }
                    .padding()
                }
                .onAppear(perform: {
                    viewModel.fetchProduct()
                })
                .navigationTitle("Products")
                .navigationBarTitleDisplayMode(.inline)
                
                //SideMenu Button
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            
                            withAnimation {
                                showSideMenu.toggle()
                            }
                            
                        }, label: {
                            Image(systemName: "list.dash")
                                .resizable()
                                .frame(width: 30, height: 20)
                                .foregroundColor(.black)
                        })
                    }
                }
            }
            
            //SideMenu show and hide(using offset)
            SideMenuView(showSideMenu: $showSideMenu)
                .offset(x: showSideMenu ? 0 : -240)
            
        }
    }
}

#Preview {
    ProductView(viewModel: ProductViewModel())
}
