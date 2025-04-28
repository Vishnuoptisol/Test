```swift
import SwiftUI

struct e_pragatiView: View {
    // State variables
    @State private var selectedTab: Tab = .wbs
    @State private var searchText: String = ""
    
    // Enum for tab selection
    enum Tab {
        case wbs, pending, upcoming
    }
    
    // List items data
    let workItems = [
        "Others (Controlled)",
        "MS Pipeline Work",
        "Pipeline Allied Works",
        "Boundary Wall & Approach Road",
        "Consumables",
        "Mobilisation",
        "Survey, Soil Investigation & Design",
        "Intake"
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            ZStack {
                Color(red: 0.05, green: 0.1, blue: 0.3)
                    .ignoresSafeArea()
                
                HStack {
                    Button(action: {
                        // Handle back action
                    }) {
                        HStack(spacing: 4) {
                            Image(systemName: "chevron.left")
                            Text("Back")
                                .fontWeight(.medium)
                        }
                        .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    Text("Daily Progress Entry")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Spacer()
                }
                .padding(.horizontal)
            }
            .frame(height: 60)
            
            ScrollView {
                VStack(spacing: 16) {
                    // Tab bar
                    HStack(spacing: 0) {
                        TabButton(title: "WBS", isSelected: selectedTab == .wbs) {
                            selectedTab = .wbs
                        }
                        
                        TabButton(title: "Pending", isSelected: selectedTab == .pending) {
                            selectedTab = .pending
                        }
                        
                        TabButton(title: "Upcoming", isSelected: selectedTab == .upcoming) {
                            selectedTab = .upcoming
                        }
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color(.systemGray6))
                    )
                    .padding(.horizontal)
                    .padding(.top, 16)
                    
                    // Project info
                    HStack {
                        Image(systemName: "info.circle")
                            .foregroundColor(Color(.systemBlue))
                        
                        Text("LE23M219 - Sahibganj- RWSS")
                            .font(.system(size: 16))
                            .foregroundColor(.primary)
                        
                        Spacer()
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(.systemGray4), lineWidth: 1)
                    )
                    .padding(.horizontal)
                    
                    // Search bar
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color(.systemGray))
                        
                        TextField("Search", text: $searchText)
                            .font(.system(size: 16))
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)
                    
                    // List items
                    VStack(spacing: 0) {
                        ForEach(workItems, id: \.self) { item in
                            Button(action: {
                                // Handle item selection
                            }) {
                                HStack {
                                    Text(item)
                                        .font(.system(size: 16))
                                        .foregroundColor(.primary)
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(Color(.systemGray2))
                                }
                                .padding()
                                .background(Color.white)
                            }
                            .overlay(
                                Rectangle()
                                    .frame(height: 1)
                                    .foregroundColor(Color(.systemGray5)),
                                alignment: .bottom
                            )
                        }
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(.systemGray4), lineWidth: 1)
                    )
                    .padding(.horizontal)
                    
                    Spacer()
                }
            }
            
            // Home indicator
            Rectangle()
                .fill(Color.black)
                .frame(width: 134, height: 5)
                .cornerRadius(2.5)
                .padding(.bottom, 8)
        }
        .background(Color(.systemGray6).ignoresSafeArea())
    }
}

struct TabButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .fontWeight(isSelected ? .semibold : .regular)
                .foregroundColor(isSelected ? .white : .primary)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
                .background(
                    Group {
                        if isSelected {
                            RoundedRectangle(cornerRadius: 25)
                                .fill(Color(red: 0.05, green: 0.1, blue: 0.3))
                        } else {
                            Color.clear
                        }
                    }
                )
        }
    }
}

struct e_pragatiView_Previews: PreviewProvider {
    static var previews: some View {
        e_pragatiView()
    }
}
```