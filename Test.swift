import SwiftUI

struct TestView: View {
    @State private var organisationExpanded = true
    @State private var factoryDetailsExpanded = false
    @State private var productCapacityExpanded = false
    @State private var financialInfoExpanded = false
    @State private var termsAccepted = false
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
                Button(action: {
                    // Menu action
                }) {
                    Image(systemName: "line.horizontal.3")
                        .foregroundColor(.white)
                        .font(.title2)
                }
                
                Spacer()
                
                Text("Vendor Onboarding")
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                
                Spacer()
            }
            .padding()
            .background(Color(UIColor(red: 0.83, green: 0.29, blue: 0.16, alpha: 1.0)))
            
            ScrollView {
                VStack(spacing: 16) {
                    // Organisation Section
                    VStack(spacing: 0) {
                        HStack {
                            Text("Organisation")
                                .font(.headline)
                                .fontWeight(.medium)
                                .foregroundColor(.black.opacity(0.7))
                            
                            Spacer()
                            
                            Button(action: {
                                organisationExpanded.toggle()
                            }) {
                                Image(systemName: organisationExpanded ? "chevron.up" : "chevron.down")
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding()
                        .background(Color(UIColor.systemGray6))
                        
                        if organisationExpanded {
                            VStack(spacing: 0) {
                                // Primary Info Row
                                HStack {
                                    ZStack {
                                        Circle()
                                            .fill(Color.green)
                                            .frame(width: 32, height: 32)
                                        
                                        Image(systemName: "checkmark")
                                            .foregroundColor(.white)
                                    }
                                    
                                    Text("Primary Info")
                                        .font(.body)
                                        .fontWeight(.medium)
                                        .padding(.leading, 8)
                                    
                                    Spacer()
                                }
                                .padding()
                                .background(Color(UIColor.systemGray6))
                                
                                Divider()
                                
                                // Contact Info Row
                                NavigationRow(title: "Contact Info", iconBackground: Color(UIColor(red: 0.96, green: 0.7, blue: 0.6, alpha: 1.0)), iconName: "info.circle")
                                
                                Divider()
                                
                                // Workplace & Workforce Info Row
                                NavigationRow(title: "Workplace & Workforce Info", iconBackground: Color(UIColor(red: 0.96, green: 0.7, blue: 0.6, alpha: 1.0)), iconName: "info.circle")
                                
                                Divider()
                                
                                // Quality Assurance Info Row
                                NavigationRow(title: "Quality Assurance Info", iconBackground: Color(UIColor(red: 0.96, green: 0.7, blue: 0.6, alpha: 1.0)), iconName: "info.circle")
                                
                                Divider()
                                
                                // Bank Details Row
                                NavigationRow(title: "Bank Details", iconBackground: Color(UIColor(red: 0.96, green: 0.7, blue: 0.6, alpha: 1.0)), iconName: "info.circle")
                                
                                Divider()
                                
                                // Sub Vendors Details Row
                                NavigationRow(title: "Sub Vendors Details", iconBackground: Color(UIColor(red: 0.96, green: 0.7, blue: 0.6, alpha: 1.0)), iconName: "info.circle")
                                
                                Divider()
                                
                                // Additional Information Row
                                NavigationRow(title: "Additional Information", iconBackground: Color(UIColor(red: 0.96, green: 0.7, blue: 0.6, alpha: 1.0)), iconName: "info.circle")
                            }
                        }
                    }
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(color: Color.black.opacity(0.05), radius: 2)
                    
                    // Factory Details Section
                    SectionHeader(title: "Factory Details", isExpanded: $factoryDetailsExpanded)
                    
                    // Product Capacity Section
                    SectionHeader(title: "Product Capacity", isExpanded: $productCapacityExpanded)
                    
                    // Financial Info Section
                    SectionHeader(title: "Financial Info", isExpanded: $financialInfoExpanded)
                    
                    // Terms & Conditions
                    HStack {
                        Button(action: {
                            termsAccepted.toggle()
                        }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 3)
                                    .stroke(Color.clear, lineWidth: 1)
                                    .background(Color(UIColor(red: 0.83, green: 0.29, blue: 0.16, alpha: 1.0)).cornerRadius(3))
                                    .frame(width: 24, height: 24)
                                
                                Image(systemName: "checkmark")
                                    .foregroundColor(.white)
                            }
                        }
                        
                        Text("Terms & Conditions")
                            .font(.body)
                            .fontWeight(.medium)
                            .padding(.leading, 8)
                        
                        Spacer()
                    }
                    .padding()
                    
                    // Submit Button
                    Button(action: {
                        // Submit action
                    }) {
                        Text("Submit for Review")
                            .font(.headline)
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(UIColor(red: 0.83, green: 0.29, blue: 0.16, alpha: 1.0)))
                            .cornerRadius(8)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                }
                .padding()
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct NavigationRow: View {
    let title: String
    let iconBackground: Color
    let iconName: String
    
    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .fill(iconBackground)
                    .frame(width: 32, height: 32)
                
                Image(systemName: iconName)
                    .foregroundColor(.white)
            }
            
            Text(title)
                .font(.body)
                .fontWeight(.medium)
                .padding(.leading, 8)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color(UIColor.systemGray6))
    }
}

struct SectionHeader: View {
    let title: String
    @Binding var isExpanded: Bool
    
    var body: some View {
        Button(action: {
            isExpanded.toggle()
        }) {
            HStack {
                Text(title)
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundColor(.black.opacity(0.7))
                
                Spacer()
                
                Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                    .foregroundColor(.gray)
            }
            .padding()
            .background(Color(UIColor.systemGray6))
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.05), radius: 2)
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}