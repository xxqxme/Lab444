import SwiftUI
let imageWidth = 120.0

struct PortfolioView: View {
    @State private var notes = ""
    @State private var showAlert = false

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                
                HeaderView()
                
                VStack(spacing: 20) {
                    
                    Image("avatar")
                        .resizable()
                        .scaledToFit()
                        .frame(width: imageWidth, height: 120)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray.opacity(0.3), lineWidth: 4))
                        .shadow(radius: 10)
                        .offset(y: -150)
                        .padding(.bottom, -60)
                    
                    Text("Петро")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Вік: 19 років")
                        Text("Навчаюсь у: НЛТУ")
                        Text("Курс: 3 курс")
                    }
                    .font(.headline)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Коментар:")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        TextField("Введіть коментар", text: $notes)
                            .textFieldStyle(.roundedBorder)
                        
                        Button(action: {
                            showAlert = true
                        }) {
                            Text("Зберегти")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding(10)
                                .background(Color.purple)
                                .cornerRadius(8)
                        }
                        .padding(.top, 10)
                        .alert("Мої дані", isPresented: $showAlert) {
                            Button("OK", role: .cancel) {}
                        } message: {
                            Text("""
                            Ім’я: Петро
                            Вік: 19 років
                            Навчаюсь у: НЛТУ
                            Курс: 3 курс
                            
                            Коментар: \(notes)
                            """)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 30)
                    
                    Spacer()
                }
            }
        }
    }
}

struct HeaderView: View {
    var body: some View {
        ZStack {
            Image("header_bg")
                .resizable()
                .scaledToFill()
                .frame(height: 150)
                .clipped()
                .opacity(0.8)
                .blur(radius: 3)
            
            VStack {
                Spacer()
                Text("МОЯ АНКЕТА")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.bottom, 10)
            }
        }
        .frame(height: 180)
    }
}

#Preview {
    PortfolioView()
}
