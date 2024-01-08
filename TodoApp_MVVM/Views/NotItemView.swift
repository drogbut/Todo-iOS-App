//
//  NotItemView.swift
//  TodoApp_MVVM
//
//  Created by Tchio Idriss  on 02.01.24.
//

import SwiftUI

struct NotItemView: View {
    @State var animate: Bool = false
    let secondaryColor: Color = Color("SecondaryAccentColor")
    
    //------------------------------------------------------------------------------
    var body: some View {
        ScrollView {
            VStack {
                Text("There are not item !")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.bottom, 20)
                
                Text("Are you a productive person? I think you should clik here the add button and add bunch of items to your todo list!")
                    .padding(.bottom, 20)
                
                NavigationLink {
                    AddView()
                } label: {
                    Text("Add something 🥳")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(
                            Color(animate ? secondaryColor : Color.accentColor)
                                .cornerRadius(10)
                        )
                    
                }
                .padding()
                .padding(.horizontal, animate ? 30 : 30)
                .shadow(
                    color: animate ? secondaryColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                    radius: 10,
                    x: 0,
                    y: animate ? 50: 30
                )
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
                
            }
            .frame(maxWidth: 400)
            .navigationTitle("Title")
            .padding(40)
            .multilineTextAlignment(.center)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    //------------------------------------------------------------------------------
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            withAnimation(
                .easeInOut(duration: 2.0)
                .repeatForever()
            ){
                animate.toggle()
                
            }
        }
        
    }
}

#Preview {
    NavigationView{
        NotItemView()
    }
    
}
