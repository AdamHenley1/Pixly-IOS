import SwiftUI

struct LoginPage: View {
    @StateObject var Colour = Colours()
    let usernamefile = "username.txt"
    let passwordfile = "password.txt"
    @State private var Username = ""
    @State private var Password = ""
    @State private var WrongUsername = 0
    @State private var WrongPassword = 0
    @State private var loginscreen = false
    @State private var signupscreen = false
    var body: some View {
        NavigationStack{
            ZStack{
                LoginBackground()
                VStack{
                    LogoAnimationblack()
                    Text("Login")
                        .TextTitle()
                    TextField("Username", text: $Username)
                        .Inputboxstyle()
                        .border(.red, width: CGFloat(WrongUsername))
                    SecureField("Password", text: $Password)
                        .Inputboxstyle()
                        .border(.red, width: CGFloat(WrongPassword))
                    HStack{
                        
                        Button("Login"){
                            WrongPassword = 0
                            WrongUsername = 0
                            
                            if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {

                                let usernamefileURL = dir.appendingPathComponent(usernamefile)
                                let passwordfileURL = dir.appendingPathComponent(passwordfile)

                                do {
                                    let usernamechecker = try String(contentsOf: usernamefileURL, encoding: .utf8)
                                    let passwordchecker = try String(contentsOf: passwordfileURL, encoding: .utf8)
                                    
                                    if Username == usernamechecker {
                                        if Password == passwordchecker{
                                            loginscreen = true
                                        }
                                        else{
                                            WrongPassword = 2
                                        }
                                    }
                                    else{
                                        WrongUsername = 2
                                    }
                                    
                                }
                                catch { print("login error: failed to read file \n line : 39 - 61")
                                }
                            }
                        }
                        .Buttonstyle()
                        
                        Button("Signup"){
                            signupscreen = true
                        }
                        .Buttonstyle()
                    // Closes HStack
                    }
                 // Closes VStack
                }
            // Closes ZStack
            }
            
            // When the SignUp putton is pressed to go to the struct called SignupPage
            .navigationDestination(isPresented: $signupscreen) {
                SignupPage()
                    .navigationBarBackButtonHidden(true)
            }
            
            // When login button is pressed and a successfull login occurs this takes it to the main page
            .navigationDestination(isPresented: $loginscreen){
                MainPage()
                    .navigationBarBackButtonHidden(true)
                
            }
        }
    }
}


    struct SignupPage: View {
        // A class of colours to use universally across each files so I only need to update the colour once for everything to change
        @StateObject var Colour = Colours()
        let usernamefile = "username.txt"
        let passwordfile = "password.txt"
        @State private var signupUsername = ""
        @State private var signupPassword = ""
        @State private var duplicateUsername = 0
        @State private var EmptyPassword = 0
        @State private var signupcomplete = false
        var body: some View {
            NavigationStack{
                // Stacks each thing ontop of each other in layers
                ZStack{
                    // Calls the struct LoginBackground and puts the view here ( its just the background )
                    LoginBackground()
                    // Stacks each thing vertically
                    VStack{
                        LogoAnimationblack()
                        Text("Sign-Up")
                            .TextTitle()
                        // Text box that lets you write in it and stores the string in variable signupUsername
                        TextField("Username", text: $signupUsername)
                            .Inputboxstyle()
                            .border(.red,width: CGFloat(duplicateUsername))
                        // Text box that lets you write in it without seeing what you wrote only * and stores the string in variable signupPassword
                        SecureField("Password", text: $signupPassword)
                            .Inputboxstyle()
                            .border(.red,width: CGFloat(EmptyPassword))
                        // Stacks each thing horizontally
                        
                        HStack{
                            
                            Button("< Back"){
                                signupcomplete = true
                            }
                            .Buttonstyle()
                            
                            
                            Button("Confirm"){
                                duplicateUsername = 0
                                EmptyPassword = 0
                                if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                                    let usernamefileURL = dir.appendingPathComponent(usernamefile)
                                    let passwordfileURL = dir.appendingPathComponent(passwordfile)
                                    
                                    do {
                                        let usernamechecker = try String(contentsOf: usernamefileURL, encoding: .utf8)
                                        
                                        if signupUsername == usernamechecker{
                                            duplicateUsername = 2
                                        }
                                    }
                                    catch {}
                                    if signupPassword.count < 8 || signupPassword.isEmpty == true{
                                        EmptyPassword = 2
                                        
                                    }
                                    else if signupUsername.isEmpty == true{
                                        duplicateUsername = 2
                                    }
                                    else if duplicateUsername <= 0{
                                        do {
                                            try signupUsername.write(to: usernamefileURL, atomically: false, encoding: .utf8)
                                            try signupPassword.write(to: passwordfileURL, atomically: false, encoding: .utf8)
                                            duplicateUsername = 0
                                            signupcomplete = true
                                        }
                                        catch {print("Sign-Up error: failed to write to file \n line : 244 - 265")
                                            
                                        }
                                    }
                                }
                                
                            }
                            .Buttonstyle()
                            
                            
                        }
                        
                    }
                }
                .navigationDestination(isPresented: $signupcomplete) {
                    LoginPage()
                        .navigationBarBackButtonHidden(true)
                }
            }
        }
    }


// login and sign up text modifiers
struct Textsylelog: ViewModifier {
    @StateObject var Colour = Colours()
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(Color.white)
            .bold()
            .padding([.bottom], 25)
    }
}
// makes it a callable funtion
extension View {
    func TextTitle() -> some View {
        self.modifier(Textsylelog())
    }
}
// styles the input boxes
struct Inputbox: ViewModifier {
    @StateObject var Colour = Colours()
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(width: 280, height: 45)
            .background(Color.black.opacity(0.3))
            .cornerRadius(10)
    }
}
// makes it a callable funtion
extension View {
    func Inputboxstyle() -> some View {
        self.modifier(Inputbox())
    }
}

// styles the buttons
struct Buttons: ViewModifier {
    @StateObject var Colour = Colours()
    func body(content: Content) -> some View {
        content
            .padding()
            .foregroundColor(Color.white)
            .frame(width: 140,height: 45)
            .background(Color(red: 0.46, green: 0.35, blue: 1.08).opacity(0.5))
            .cornerRadius(10)
    }
}
// makes it a callable funtion
extension View {
    func Buttonstyle() -> some View {
        self.modifier(Buttons())
    }
}
// so that i can preview what this will look like

#Preview {
    LoginPage()
}
