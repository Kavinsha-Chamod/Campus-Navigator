import SwiftUI

struct LandingView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 255, green: 255, blue: 255)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Image("splashIcon")
                        .resizable()
                        .frame(height: 300)
                    
                    HStack {
                        Text("Campus ")
                            .font(.system(size: 36, weight: .bold, design: .default))
                        +
                        Text("Navigator")
                            .font(.system(size: 32, weight: .regular, design: .default))
                    }
                    .padding(.top, 20)
                    .padding(.leading, 20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack {
                        Text("Lost on campus? Not anymore!")
                            .font(.system(size: 20, weight: .medium, design: .default))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("Campus Navigator is your ultimate guide to university life! Easily find lecture halls, stay updated on campus events, and more all in one convenient app.")
                            .font(.system(size: 16, weight: .regular, design: .default))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, 5)
                            .padding(.trailing, 20)
                    }
                    .padding(.leading, 20)
                    
                    ButtonView(
                        title: "LOGIN",
                        backgroundColor: Color(hex:"007AFF"),
                        foregroundColor: .white,
                        borderColor: Color(hex:"007AFF"),
                        destination: AnyView(LoginView()) 
                    )
                    .padding(.top, 30)
                    
                    ButtonView(
                        title: "REGISTER",
                        backgroundColor: Color.clear,
                        foregroundColor: .black,
                        borderColor: Color(hex:"007AFF"),
                        destination: AnyView(RegisterView())
                    )
                    .padding(.top, 10)
                }
            }
        }
    }
}

#Preview {
    LandingView()
}

