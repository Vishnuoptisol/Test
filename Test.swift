Here's the Swift code to recreate the UI shown in the image:

import SwiftUI

struct TestView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Chittorgarh → package I → OHSR → 100KL → 18M → Jawada → Plinth Protection")
                .font(.system(size: 14, weight: .medium))
                .lineLimit(2)
                .padding(.horizontal)
            
            VStack(spacing: 12) {
                HStack {
                    Text("Man")
                    Spacer()
                    Text("QTY")
                    Spacer()
                    Text("UOM")
                    Spacer()
                    Text("Date")
                }
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(.gray)
                
                HStack {
                    Text("1")
                    Spacer()
                    Text("5")
                    Spacer()
                    Text("m3")
                    Spacer()
                    Text("11/01/2025")
                }
                .font(.system(size: 14, weight: .regular))
                
                HStack {
                    Text("WP")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.gray)
                    Spacer()
                    Text("Status")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.gray)
                }
                
                HStack {
                    Text("ESR - 100KL - 18M - Jawada")
                        .font(.system(size: 14, weight: .regular))
                    Spacer()
                    Text("Approved")
                        .font(.system(size: 14, weight: .medium))
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.green.opacity(0.2))
                        .cornerRadius(4)
                }
            }
            .padding()
        }
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
        .padding()
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}