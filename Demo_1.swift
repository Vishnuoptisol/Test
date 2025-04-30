Here's the Swift code to recreate the UI shown in the image:

import SwiftUI

struct Demo_1View: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Chittorgarh → package I → OHSR → 100KL → 18M → Jawada → Plinth Protection")
                .font(.system(size: 14, weight: .medium))
                .lineLimit(2)
                .padding(.horizontal)
            
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Man")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundColor(.gray)
                    Text("1")
                        .font(.system(size: 14, weight: .medium))
                }
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("QTY")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundColor(.gray)
                    Text("5")
                        .font(.system(size: 14, weight: .medium))
                }
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("UOM")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundColor(.gray)
                    Text("m3")
                        .font(.system(size: 14, weight: .medium))
                }
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Date")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundColor(.gray)
                    Text("11/01/2025")
                        .font(.system(size: 14, weight: .medium))
                }
            }
            .padding(.horizontal)
            
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("WP")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundColor(.gray)
                    Text("ESR - 100KL - 18M - Jawada")
                        .font(.system(size: 14, weight: .medium))
                }
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 5) {
                    Text("Status")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundColor(.gray)
                    Text("Approved")
                        .font(.system(size: 14, weight: .medium))
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.green.opacity(0.2))
                        .cornerRadius(4)
                }
            }
            .padding(.horizontal)
        }
        .padding(.vertical)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

struct Demo_1View_Previews: PreviewProvider {
    static var previews: some View {
        Demo_1View()
    }
}