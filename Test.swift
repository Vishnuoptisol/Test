import SwiftUI

struct TestView: View {
    @State private var organisationExpanded = true
    @State private var factoryDetailsExpanded = false
    @State private var productCapacityExpanded = false
    @State private var financialInfoExpanded = false
    @State private var termsAccepted = true
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Navigation bar
                HStack {
                    Button(action: {
                        // Menu action
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .foregroundColor(.white)
                            .font(.system(size: 24))
                    }
                    Spacer()
                    Text("Vendor Onboarding")
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding()
                .background(Color(UIColor(red: 0.8, green: 0.3, blue: 0.2, alpha: 1.0)))
                
                ScrollView {
                    VStack(spacing: 20) {
                        // Organisation Section
                        VStack(spacing: 0) {
                            HStack {
                                Text("Organisation")
                                    .font(.headline)
                                    .foregroundColor(.gray)
                                Spacer()
                                Image(systemName: organisationExpanded ? "chevron.up" : "chevron.down")
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .contentShape(Rectangle())
                            .onTapGesture {
                                withAnimation {
                                    organisationExpanded.toggle()
                                }
                            }
                            
                            if organisationExpanded {
                                VStack(spacing: 0) {
                                    infoRow(icon: "checkmark.circle.fill", iconColor: .green, title: "Primary Info")
                                    
                                    Divider().padding(.leading, 60)
                                    
                                    infoRow(icon: "info.circle.fill", iconColor: Color(UIColor(red: 0.95, green: 0.75, blue: 0.65, alpha: 1.0)), title: "Contact Info", hasNavigation: true)
                                    
                                    Divider().padding(.leading, 60)
                                    
                                    infoRow(icon: "info.circle.fill", iconColor: Color(UIColor(red: 0.95, green: 0.75, blue: 0.65, alpha: 1.0)), title: "Workplace & Workforce Info", hasNavigation: true)
                                    
                                    Divider().padding(.leading, 60)
                                    
                                    infoRow(icon: "info.circle.fill", iconColor: Color(UIColor(red: 0.95, green: 0.75, blue: 0.65, alpha: 1.0)), title: "Quality Assurance Info", hasNavigation: true)
                                    
                                    Divider().padding(.leading, 60)
                                    
                                    infoRow(icon: "info.circle.fill", iconColor: Color(UIColor(red: 0.95, green: 0.75, blue: 0.65, alpha: 1.0)), title: "Bank Details", hasNavigation: true)
                                    
                                    Divider().padding(.leading, 60)
                                    
                                    infoRow(icon: "info.circle.fill", iconColor: Color(UIColor(red: 0.95, green: 0.75, blue: 0.65, alpha: 1.0)), title: "Sub Vendors Details", hasNavigation: true)
                                    
                                    Divider().padding(.leading, 60)
                                    
                                    infoRow(icon: "info.circle.fill", iconColor: Color(UIColor(red: 0.95, green: 0.75, blue: 0.65, alpha: 1.0)), title: "Additional Information", hasNavigation: true)
                                }
                            }
                        }
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.05), radius: 2)
                        
                        // Factory Details Section
                        VStack(spacing: 0) {
                            HStack {
                                Text("Factory Details")
                                    .font(.headline)
                                    .foregroundColor(.gray)
                                Spacer()
                                Image(systemName: factoryDetailsExpanded ? "chevron.up" : "chevron.down")
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .contentShape(Rectangle())
                            .onTapGesture {
                                withAnimation {
                                    factoryDetailsExpanded.toggle()
                                }
                            }
                            
                            // Hidden content for Factory Details
                        }
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.05), radius: 2)
                        
                        // Product Capacity Section
                        VStack(spacing: 0) {
                            HStack {
                                Text("Product Capacity")
                                    .font(.headline)
                                    .foregroundColor(.gray)
                                Spacer()
                                Image(systemName: productCapacityExpanded ? "chevron.up" : "chevron.down")
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .contentShape(Rectangle())
                            .onTapGesture {
                                withAnimation {
                                    productCapacityExpanded.toggle()
                                }
                            }
                            
                            // Hidden content for Product Capacity
                        }
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.05), radius: 2)
                        
                        // Financial Info Section
                        VStack(spacing: 0) {
                            HStack {
                                Text("Financial Info")
                                    .font(.headline)
                                    .foregroundColor(.gray)
                                Spacer()
                                Image(systemName: financialInfoExpanded ? "chevron.up" : "chevron.down")
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .contentShape(Rectangle())
                            .onTapGesture {
                                withAnimation {
                                    financialInfoExpanded.toggle()
                                }
                            }
                            
                            // Hidden content for Financial Info
                        }
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.05), radius: 2)
                        
                        // Terms & Conditions
                        HStack {
                            Image(systemName: termsAccepted ? "checkmark.square.fill" : "square")
                                .foregroundColor(termsAccepted ? Color(UIColor(red: 0.8, green: 0.3, blue: 0.2, alpha: 1.0)) : .gray)
                                .font(.system(size: 24))
                                .onTapGesture {
                                    termsAccepted.toggle()
                                }
                            
                            Text("Terms & Conditions")
                                .font(.headline)
                                .foregroundColor(.gray)
                            
                            Spacer()
                        }
                        .padding()
                        
                        // Submit Button
                        Button(action: {
                            // Submit action
                        }) {
                            Text("Submit for Review")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color(UIColor(red: 0.8, green: 0.3, blue: 0.2, alpha: 1.0)))
                                .cornerRadius(8)
                        }
                        .padding(.horizontal)
                    }
                    .padding()
                }
                .background(Color(UIColor.systemGroupedBackground))
            }
            .edgesIgnoringSafeArea(.top)
        }
    }
    
    // Helper function to create info rows
    private func infoRow(icon: String, iconColor: Color, title: String, hasNavigation: Bool = false) -> some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(iconColor)
                .font(.system(size: 24))
                .frame(width: 36, height: 36)
                .background(iconColor.opacity(0.2))
                .cornerRadius(18)
                .padding(.leading, 16)
            
            Text(title)
                .font(.body)
                .foregroundColor(.gray)
                .padding(.leading, 8)
            
            Spacer()
            
            if hasNavigation {
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
                    .padding(.trailing)
            }
        }
        .padding(.vertical, 12)
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}