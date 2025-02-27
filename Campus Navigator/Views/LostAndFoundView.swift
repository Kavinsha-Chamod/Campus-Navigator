import SwiftUI

struct LostAndFoundView: View {
    @State private var searchText: String = ""
    @State private var searchResults: [String] = []

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                }
                .padding(.top)

                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                        ForEach(searchResults, id: \.self) { result in
                            NavigationLink(destination: LostItemDetailView(
                                imageName: result,
                                itemName: "iPhone 16pro",
                                reportedBy: "Amal Perera",
                                locationLost: "Near the Campus Library Entrance",
                                description: "Apple iPhone 16 Pro\nColor Space Black\nTransparent case with a small sticker of a blue star\nSlight scratch near the camera module"
                            )) {
                                if result.contains("http") {
                                    AsyncImage(url: URL(string: result)) { phase in
                                        switch phase {
                                        case .empty:
                                            ProgressView()
                                        case .success(let image):
                                            image
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
                                                .cornerRadius(8)
                                        case .failure:
                                            Image(systemName: "photo")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
                                                .cornerRadius(8)
                                        @unknown default:
                                            EmptyView()
                                        }
                                    }
                                } else {
                                    Image(result) // Load local assets
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
                                        .cornerRadius(8)
                                }
                            }
                        }
                    }
                    .padding()
                }

                Spacer()

                HStack {
                    Spacer()
                    NavigationLink(destination: ReportItemLostView()) {
                        HStack {
                            Text("Report Item Lost")
                            Image(systemName: "paperplane.fill")
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(25)
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                }
            }
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
        .onChange(of: searchText, perform: { _ in
            performSearch()
        })
        .onAppear {
            UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = .white
            UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).attributedPlaceholder = NSAttributedString(
                string: "Search...",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
            )
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Lost and Found")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.black)
            }
        }
    }

    func performSearch() {
        if searchText.lowercased().contains("iphone 16") {
            searchResults = [
                "iphone1",
                "iphone2",
                "iphone3"
            ]
        } else if searchText.lowercased().contains("laptop") {
            searchResults = [
                "laptop1",
                "laptop2"
            ]
        } else {
            searchResults = []
        }
    }
}

#Preview {
    LostAndFoundView()
}
