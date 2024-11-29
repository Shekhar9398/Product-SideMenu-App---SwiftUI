
import SwiftUI

struct BaseView: View {
    
    @State private var showSideMenu = false
    
    var body: some View {
        ZStack{
        NavigationStack {
            VStack(alignment: .leading){
                Text("Base View")
                
            }
            .navigationTitle("Home")
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
                            .frame(width: 30, height: 30)
                            .foregroundColor(.black)
                    })
                }
            }
        }
            //Note: because of we showing sideMenu inside the zstack sideMenuView will appear above the navigationStack

                SideMenuView(showSideMenu:$showSideMenu)
                .offset(x: showSideMenu ? 0 : -250) // Appear from left
            
        }
        
       
    
    
        
    }
}

#Preview {
    BaseView()
}
