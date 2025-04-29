```swift
import SwiftUI

struct TestView: View {
    var body: some View {
        VStack(spacing: 0) {
            // Header with path information
            VStack(alignment: .leading, spacing: 4) {
                Text("Chittorgarh → package I → OHSR → 100KL → 18M → Jawada → Plinth Protection")
                    .font(.system(size: 16, weight: .medium))
                    .padding(.vertical, 12)
                    .padding(.horizontal)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .background(Color(UIColor.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Divider()
                .padding(.horizontal)
            
            // Content
            VStack(alignment: .leading, spacing: 16) {
                // First row
                HStack {
                    Text("Man")
                        .frame(width: 60, alignment: .leading)
                        .foregroundColor(.gray)
                    
                    Text("QTY")
                        .frame(width: 60, alignment: .leading)
                        .foregroundColor(.gray)
                    
                    Text("UOM")
                        .frame(width: 60, alignment: .leading)
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    Text("Date")
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                
                // Second row
                HStack {
                    Text("1")
                        .frame(width: 60, alignment: .leading)
                    
                    Text("5")
                        .frame(width: 60, alignment: .leading)
                    
                    Text("m3")
                        .frame(width: 60, alignment: .leading)
                    
                    Spacer()
                    
                    Text("11/01/2025")
                }
                .padding(.horizontal)
                
                // Third row
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("WP")
                            .foregroundColor(.gray)
                        
                        Text("ESR - 100KL - 18M - Jawada")
                            .font(.system(size: 16, weight: .medium))
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing, spacing: 4) {
                        Text("Status")
                            .foregroundColor(.gray)
                        
                        Text("Approved")
                            .font(.system(size: 14))
                            .foregroundColor(.black)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(Color(UIColor.systemGray5))
                            .cornerRadius(4)
                    }
                }
                .padding(.horizontal)
                
            }
            .padding(.vertical, 12)
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 1)
        .padding()
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
```