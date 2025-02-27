import SwiftUI

struct LostAndFoundView: View {
    @State private var searchText: String = ""
    @State private var searchResults: [String] = []

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                    Text("Lost and Found")
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding(.top)

                SearchBar(text: $searchText, onSearchChange: performSearch)

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
                            }
                        }
                    }
                    .padding()
                }

                Spacer()

                HStack {
                    Spacer()
                    NavigationLink(destination: ReportItemLostView()) { // NavigationLink here
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
            .navigationBarHidden(true)
        }
    }

    func performSearch() {
        if searchText.lowercased().contains("iphone 16") {
            searchResults = [
                "https://i.dummyjson.com/data/products/1/thumbnail.jpg",
                "https://i.dummyjson.com/data/products/2/thumbnail.jpg",
                "https://i.dummyjson.com/data/products/3/thumbnail.jpg"
            ]
        } else if searchText.lowercased().contains("laptop") {
            searchResults = [
                "https://i.dummyjson.com/data/products/8/thumbnail.jpg",
                "https://i.dummyjson.com/data/products/9/thumbnail.jpg"
            ]
        } else {
            searchResults = []
        }
    }
}

struct SearchBar: View {
    @Binding var text: String
    var onSearchChange: () -> Void

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)

            TextField("Search", text: $text)
                .textFieldStyle(PlainTextFieldStyle())
                .onChange(of: text) { _ in
                    onSearchChange()
                }
        }
        .padding(8)
        .background(Color(.systemGray6))
        .cornerRadius(8)
        .padding(.horizontal)
    }
}

#Preview {
    LostAndFoundView()
}
