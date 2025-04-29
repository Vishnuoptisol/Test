```swift
import SwiftUI

struct TestView: View {
    var body: some View {
        VStack(spacing: 0) {
            // Header section with project details
            VStack(alignment: .leading, spacing: 4) {
                Text("Chittorgarh → package I → OHSR → 100KL → 18M → Jawada → Plinth Protection")
                    .font(.system(size: 16, weight: .medium))
                    .padding(.vertical, 12)
                    .padding(.horizontal, 16)
                    .multilineTextAlignment(.leading)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(UIColor.systemGray6))
            
            Divider()
            
            // Details section
            VStack(spacing: 16) {
                // First row - Man, QTY, UOM, Date
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Man")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                        Text("1")
                            .font(.system(size: 16))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("QTY")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                        Text("5")
                            .font(.system(size: 16))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("UOM")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                        Text("m3")
                            .font(.system(size: 16))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Date")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                        Text("11/01/2025")
                            .font(.system(size: 16))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal, 16)
                .padding(.top, 16)
                
                // Second row - WP and Status
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("WP")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                        Text("ESR - 100KL - 18M - Jawada")
                            .font(.system(size: 16))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Status")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                        Text("Approved")
                            .font(.system(size: 14, weight: .medium))
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(Color(UIColor.systemGray5))
                            .cornerRadius(4)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 16)
            }
        }
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
        .padding(.horizontal, 16)
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color(UIColor.systemBackground))
    }
}
```