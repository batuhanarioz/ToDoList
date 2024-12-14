import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(title: "Neler Yapacağız?", subtitle: "Yaptıklarımdan pişman değilim.", subtitle2: "Aklım hala yapmadıklarımda!", angle: 15, background: .orange)

                // Login Form
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    TextField("Email Adresiniz", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                    SecureField("Şifreniz", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())

                    TLButton(
                        title: "Giriş Yap",
                        background: .orange
                    )   {
                        viewModel.login()
                    }
                }
                .offset(y: -50)
                
                // Create Account
                VStack {
                    Text("Henüz bir hesabınız yok mu?")
                    NavigationLink("Hesap oluştur!",
                                   destination: RegisterView())
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider { 
    static var previews: some View {
        LoginView()
    }
}
