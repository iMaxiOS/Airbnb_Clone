//
//  ProfileView.swift
//  Airbnb_Clone
//
//  Created by Maxim Hranchenko on 23.10.2023.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 32) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Profile")
                        .font(.title)
                    .fontWeight(.semibold)
                    
                    Text("Log in to start playning your next trip.")
                        .font(.subheadline)
                }
                
                Button(action: {}, label: {
                    Text("Log in")
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                        .background(.pink)
                        .clipShape(.rect(cornerRadius: 8))
                })
                    
                HStack(alignment: .bottom) {
                    Text("Don`t have an account?")
                        .font(.footnote)
                    
                    Button(action: {}, label: {
                        Text("Sign up")
                            .foregroundStyle(.black)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .underline()
                    })
                }
            }
            
            VStack(spacing: 24) {
                ProfileOptionRowView(imageName: "gear", title: "Settings")
                ProfileOptionRowView(imageName: "gear", title: "Accessibility")
                ProfileOptionRowView(imageName: "questionmark.circle", title: "Visit the help center")
            }
            .padding(.vertical)
        }
        .padding(.horizontal)
    }
}

#Preview {
    ProfileView()
}
