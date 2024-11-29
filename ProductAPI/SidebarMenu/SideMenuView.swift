
import SwiftUI

struct SideMenuView: View {
    
    @Binding var showSideMenu : Bool
    
    var body: some View {
        
        ZStack(alignment: .leading){
            
            if showSideMenu{
                Rectangle()
                    .background(.thinMaterial)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation {
                            showSideMenu.toggle()
                        }
                    }
            }
            
            HStack{
                Form{
                    //Person Profile Pic
                    Section{
                        HStack{
                            
                            Image(systemName: "person.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .clipShape(Circle())
                                .overlay{
                                    Circle().stroke(Color.gray, lineWidth: 2)
                                }
                            
                            
                            VStack(alignment: .leading, spacing: 7){
                                Text("Shekhar")
                                    .font(.headline)
                                
                                Text("think@gmail.com")
                                    .font(.footnote)
                            }
                            .padding(.horizontal)
                            
                        }
                    }
                    
//                    Spacer()
                    
                    Section{
                        //item 1
                        Label("Favorites", systemImage: "star.fill")
                            .foregroundColor(.black)
                        
                        //item 2
                        Label("Favorites", systemImage: "star.fill")
                            .foregroundColor(.pink)
                        
                        //item 3
                        Label("Favorites", systemImage: "star.fill")
                            .foregroundColor(.mint)
                    }
                    
                    Section{
                        //item 1
                        Label("Favorites", systemImage: "star.fill")
                            .foregroundColor(.black)
                        
                        //item 2
                        Label("Favorites", systemImage: "star.fill")
                            .foregroundColor(.pink)
                        
                        //item 3
                        Label("Favorites", systemImage: "star.fill")
                            .foregroundColor(.mint)
                    }

                }
                .frame(maxWidth: 240, maxHeight: .infinity)
                .background(Color.white)
                .listStyle(.inset)
                
                Spacer()
                
            }
        }
    }
}

#Preview {
    SideMenuView(showSideMenu: .constant(true))
}
