Here's the Swift code representation of the UI design from the uploaded image:

import SwiftUI

struct TestView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Chittorgarh → package I → OHSR → 100KL → 18M → Jawada → Plinth Protection")
                .font(.system(size: 14, weight: .medium))
                .lineLimit(2)
                .padding(.horizontal, 16)
                .padding(.top, 16)
            
            VStack(spacing: 8) {
                HStack {
                    Text("Man")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.gray)
                    Spacer()
                    Text("QTY")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.gray)
                    Spacer()
                    Text("UOM")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.gray)
                    Spacer()
                    Text("Date")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.gray)
                }
                
                HStack {
                    Text("1")
                        .font(.system(size: 14, weight: .regular))
                    Spacer()
                    Text("5")
                        .font(.system(size: 14, weight: .regular))
                    Spacer()
                    Text("m3")
                        .font(.system(size: 14, weight: .regular))
                    Spacer()
                    Text("11/01/2025")
                        .font(.system(size: 14, weight: .regular))
                }
            }
            .padding(.horizontal, 16)
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("WP")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.gray)
                    Text("ESR - 100KL - 18M - Jawada")
                        .font(.system(size: 14, weight: .regular))
                }
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 4) {
                    Text("Status")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.gray)
                    Text("Approved")
                        .font(.system(size: 14, weight: .medium))
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.green.opacity(0.2))
                        .cornerRadius(4)
                }
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 16)
        }
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}