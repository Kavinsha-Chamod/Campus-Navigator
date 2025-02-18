import SwiftUI

struct LandingView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0.792, green: 0.941, blue: 0.973)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Image("splashScreen")
                        .resizable()
                        .frame(height: 250)
                    
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
                        
                        Text("Campus Navigator is your ultimate guide to university life! Easily find lecture halls, stay updated on campus events, and more—all in one convenient app.")
                            .font(.system(size: 16, weight: .regular, design: .default))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, 5)
                            .padding(.trailing, 20)
                    }
                    .padding(.leading, 20)
                    
                    // LOGIN BUTTON
                    ButtonView(
                        title: "LOGIN",
                        backgroundColor: Color(red: 2/255, green: 62/255, blue: 138/255, opacity: 1),
                        foregroundColor: .white,
                        borderColor: Color(red: 2/255, green: 62/255, blue: 138/255, opacity: 1),
                        destination: AnyView(LoginView()) // Now handles navigation properly
                    )
                    .padding(.top, 30)
                    
                    // REGISTER BUTTON
                    ButtonView(
                        title: "REGISTER",
                        backgroundColor: Color.clear,
                        foregroundColor: .black,
                        borderColor: Color(red: 2/255, green: 62/255, blue: 138/255, opacity: 1),
                        destination: AnyView(RegisterView()) // Now handles navigation properly
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

