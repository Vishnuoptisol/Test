```swift
import SwiftUI

struct Component_View: View {
    var body: some View {
        VStack(spacing: 0) {
            // Header section with path information
            VStack(alignment: .leading, spacing: 2) {
                Text("Chittorgarh → package I → OHSR → 100KL →\n18M → Jawada → Plinth Protection")
                    .font(.system(size: 18, weight: .medium))
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(UIColor.systemGray6))
            
            Divider()
            
            // Details section
            VStack(spacing: 12) {
                // First row
                HStack {
                    Text("Man")
                        .foregroundColor(.gray)
                        .frame(width: 80, alignment: .leading)
                    
                    Text("QTY")
                        .foregroundColor(.gray)
                        .frame(width: 80, alignment: .leading)
                    
                    Text("UOM")
                        .foregroundColor(.gray)
                        .frame(width: 80, alignment: .leading)
                    
                    Spacer()
                    
                    Text("Date")
                        .foregroundColor(.gray)
                }
                .padding(.horizontal, 16)
                .padding(.top, 12)
                
                // Second row
                HStack {
                    Text("1")
                        .frame(width: 80, alignment: .leading)
                    
                    Text("5")
                        .frame(width: 80, alignment: .leading)
                    
                    Text("m3")
                        .frame(width: 80, alignment: .leading)
                    
                    Spacer()
                    
                    Text("11/01/2025")
                }
                .padding(.horizontal, 16)
                
                // Third row
                HStack {
                    VStack(alignment: .leading) {
                        Text("WP")
                            .foregroundColor(.gray)
                        Text("ESR - 100KL - 18M - Jawada")
                            .font(.system(size: 17, weight: .medium))
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text("Status")
                            .foregroundColor(.gray)
                        Text("Approved")
                            .font(.system(size: 15))
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(Color(UIColor.systemGray5))
                            .cornerRadius(4)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 12)
            }
        }
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

struct Component_View_Previews: PreviewProvider {
    static var previews: some View {
        Component_View()
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.gray.opacity(0.2))
    }
}
```