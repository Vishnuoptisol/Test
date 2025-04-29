```swift
import SwiftUI

struct ComponentView: View {
    var body: some View {
        VStack(spacing: 0) {
            // Header section with path information
            VStack(alignment: .leading, spacing: 4) {
                Text("Chittorgarh → package | → OHSR → 100KL → 18M → Jawada → Plinth Protection")
                    .font(.system(size: 16, weight: .semibold))
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    .lineLimit(2)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(UIColor.systemGray6))
            
            Divider()
            
            // Details section
            VStack(spacing: 8) {
                // First row: Man, QTY, UOM, Date
                HStack {
                    Text("Man")
                        .foregroundColor(.gray)
                        .frame(width: 70, alignment: .leading)
                    
                    Text("QTY")
                        .foregroundColor(.gray)
                        .frame(width: 70, alignment: .leading)
                    
                    Text("UOM")
                        .foregroundColor(.gray)
                        .frame(width: 70, alignment: .leading)
                    
                    Text("Date")
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal, 16)
                .padding(.top, 12)
                
                // Second row: 1, 5, m3, 11/01/2025
                HStack {
                    Text("1")
                        .frame(width: 70, alignment: .leading)
                    
                    Text("5")
                        .frame(width: 70, alignment: .leading)
                    
                    Text("m3")
                        .frame(width: 70, alignment: .leading)
                    
                    Text("11/01/2025")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal, 16)
                
                // Third row: WP, Status
                HStack {
                    Text("WP")
                        .foregroundColor(.gray)
                        .frame(width: 70, alignment: .leading)
                    
                    Spacer()
                    
                    Text("Status")
                        .foregroundColor(.gray)
                }
                .padding(.horizontal, 16)
                .padding(.top, 4)
                
                // Fourth row: ESR - 100KL - 18M - Jawada, Approved
                HStack {
                    Text("ESR - 100KL - 18M - Jawada")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("Approved")
                        .foregroundColor(.black)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color(UIColor.systemGray5))
                        .cornerRadius(4)
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 12)
            }
        }
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(UIColor.systemGray5), lineWidth: 1)
        )
        .padding()
    }
}

struct ComponentView_Previews: PreviewProvider {
    static var previews: some View {
        ComponentView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
```