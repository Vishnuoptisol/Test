```swift
import SwiftUI

struct vendorView: View {
    @State private var organisationExpanded = true
    @State private var factoryDetailsExpanded = false
    @State private var productCapacityExpanded = false
    @State private var financialInfoExpanded = false
    @State private var termsAccepted = true
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
                Button(action: {}) {
                    Image(systemName: "line.horizontal.3")
                        .font(.title2)
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                Text("Vendor Onboarding")
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                
                Spacer()
            }
            .padding()
            .background(Color(UIColor(red: 0.91, green: 0.30, blue: 0.24, alpha: 1.0)))
            
            ScrollView {
                VStack(spacing: 16) {
                    // Organisation Section
                    VStack(spacing: 0) {
                        HStack {
                            Text("Organisation")
                                .font(.headline)
                                .foregroundColor(.gray)
                            
                            Spacer()
                            
                            Button(action: {
                                organisationExpanded.toggle()
                            }) {
                                Image(systemName: organisationExpanded ? "chevron.up" : "chevron.down")
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        
                        if organisationExpanded {
                            VStack(spacing: 0) {
                                // Primary Info - Completed
                                HStack {
                                    ZStack {
                                        Circle()
                                            .fill(Color.green)
                                            .frame(width: 28, height: 28)
                                        
                                        Image(systemName: "checkmark")
                                            .font(.system(size: 14))
                                            .foregroundColor(.white)
                                    }
                                    
                                    Text("Primary Info")
                                        .font(.body)
                                        .padding(.leading, 8)
                                    
                                    Spacer()
                                }
                                .padding(.vertical, 12)
                                .padding(.horizontal)
                                Divider()
                                
                                // Other info items - Pending
                                ForEach(["Contact Info", "Workplace & Workforce Info", "Quality Assurance Info", "Bank Details", "Sub Vendors Details", "Additional Information"], id: \.self) { item in
                                    NavigationLink(destination: EmptyView()) {
                                        HStack {
                                            ZStack {
                                                Circle()
                                                    .fill(Color(UIColor(red: 0.98, green: 0.80, blue: 0.73, alpha: 1.0)))
                                                    .frame(width: 28, height: 28)
                                                
                                                Text("i")
                                                    .font(.system(size: 16))
                                                    .foregroundColor(.gray)
                                            }
                                            
                                            Text(item)
                                                .font(.body)
                                                .foregroundColor(.black)
                                                .padding(.leading, 8)
                                            
                                            Spacer()
                                            
                                            Image(systemName: "chevron.right")
                                                .foregroundColor(.gray)
                                        }
                                        .padding(.vertical, 12)
                                        .padding(.horizontal)
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                    
                                    if item != "Additional Information" {
                                        Divider()
                                            .padding(.leading, 56)
                                    }
                                }
                            }
                            .background(Color.white)
                        }
                    }
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.05), radius: 2)
                    
                    // Factory Details Section
                    ExpandableSectionView(
                        title: "Factory Details", 
                        isExpanded: $factoryDetailsExpanded, 
                        content: {
                            // This would contain factory details content
                            EmptyView()
                        }
                    )
                    
                    // Product Capacity Section
                    ExpandableSectionView(
                        title: "Product Capacity",
                        isExpanded: $productCapacityExpanded,
                        content: {
                            // This would contain product capacity content
                            EmptyView()
                        }
                    )
                    
                    // Financial Info Section
                    ExpandableSectionView(
                        title: "Financial Info",
                        isExpanded: $financialInfoExpanded,
                        content: {
                            // This would contain financial info content
                            EmptyView()
                        }
                    )
                    
                    // Terms & Conditions
                    HStack {
                        Button(action: {
                            termsAccepted.toggle()
                        }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(termsAccepted ? Color(UIColor(red: 0.91, green: 0.30, blue: 0.24, alpha: 1.0)) : Color.white)
                                    .frame(width: 24, height: 24)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 4)
                                            .stroke(termsAccepted ? Color(UIColor(red: 0.91, green: 0.30, blue: 0.24, alpha: 1.0)) : Color.gray, lineWidth: 1)
                                    )
                                
                                if termsAccepted {
                                    Image(systemName: "checkmark")
                                        .font(.system(size: 14))
                                        .foregroundColor(.white)
                                }
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        Text("Terms & Conditions")
                            .font(.body)
                            .foregroundColor(.gray)
                            .padding(.leading, 8)
                        
                        Spacer()
                    }
                    .padding()
                    
                    // Submit Button
                    Button(action: {}) {
                        Text("Submit for Review")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(UIColor(red: 0.91, green: 0.30, blue: 0.24, alpha: 1.0)))
                            .cornerRadius(8)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 16)
                }
                .padding(.vertical)
            }
            .background(Color(.systemGray6))
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct ExpandableSectionView<Content: View>: View {
    var title: String
    @Binding var isExpanded: Bool
    var content: () -> Content
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.gray)
                
                Spacer()
                
                Button(action: {
                    isExpanded.toggle()
                }) {
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .foregroundColor(.gray)
                }
            }
            .padding()
            .background(Color(.systemGray6))
            
            if isExpanded {
                content()
                    .padding()
                    .background(Color.white)
            }
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.05), radius: 2)
    }
}

struct vendorView_Previews: PreviewProvider {
    static var previews: some View {
        vendorView()
    }
}
```