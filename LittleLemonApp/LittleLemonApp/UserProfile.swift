import SwiftUI

struct UserProfile: View {
    @State private var firstName = UserDefaults.standard.string(forKey: kFirstName) ?? "N/A"
    @State private var lastName = UserDefaults.standard.string(forKey: kLastName) ?? "N/A"
    @State private var email = UserDefaults.standard.string(forKey: kEmail) ?? "N/A"
    @Environment(\.presentationMode) var presentation

    var body: some View {
        ZStack {
            Color.appYellow.edgesIgnoringSafeArea(.all) // Yellow background

            VStack(spacing: 20) {
                Text("Profile Information")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.appBlue)

                Spacer().frame(height: 20) // Extra space

                // Profile Image
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .foregroundColor(Color.appBlue)
                    .padding()

                // First Name
                HStack {
                    Text("First Name:")
                        .font(.headline)
                        .foregroundColor(Color.appBlue)
                    Spacer()
                    Text(firstName)
                        .font(.subheadline)
                        .foregroundColor(Color.appGrayText)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding(.horizontal)

                // Last Name
                HStack {
                    Text("Last Name:")
                        .font(.headline)
                        .foregroundColor(Color.appBlue)
                    Spacer()
                    Text(lastName)
                        .font(.subheadline)
                        .foregroundColor(Color.appGrayText)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding(.horizontal)

                // Email
                HStack {
                    Text("Email:")
                        .font(.headline)
                        .foregroundColor(Color.appBlue)
                    Spacer()
                    Text(email)
                        .font(.subheadline)
                        .foregroundColor(Color.appGrayText)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding(.horizontal)

                Spacer()

                // Logout Button
                Button(action: {
                    UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                    self.presentation.wrappedValue.dismiss()
                }) {
                    Text("Log Out")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.appBlue)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                .padding(.bottom, 30)
            }
        }
        .navigationTitle("Profile")
    }
}

