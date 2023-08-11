import SwiftUI
import WebKit

struct ContentView: View {
    
    @State private var showWebView = false
    private let urlString0: String = "https://tlotd.net"
    private let urlString1: String = "https://tlotd.net/members"
    private let urlString2: String = "https://tlotd.net/servers"
    private let urlString3: String = "https://tlotd.net/tlotd"
    @State var selectedIndex = 0
    
    let icons = [
        "house",
        "person.2",
        "server.rack",
        "person.circle",
        "gear"
    
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            ZStack {
                switch selectedIndex {
                case 0:
                    NavigationView{
                        VStack{
                            WebView(url: URL(string: urlString0)!)
                        }
                    }
                case 1:
                    NavigationView{
                        VStack{
                            WebView(url: URL(string: urlString1)!)
                        }
                    }
                case 2:
                    NavigationView{
                        VStack{
                            WebView(url: URL(string: urlString2)!)
                        }
                    }
                case 3:
                    NavigationView{
                        VStack{
                            WebView(url: URL(string: urlString3)!)
                        }
                    }
                case 4:
                    NavigationView{
                        VStack{
                            Text("This page is currently in development.")
                            Text("Created by Isla_Nublar.")
                            Button(action: {}, label: {Text("I do nothing.")})
                        }
                        .navigationTitle("Settings")
                    }
                default:
                    NavigationView{
                        VStack{
                            Text("This page is currently in development.")
                        }
                        .navigationTitle("W.I.P.")
                    }
                }
            }
            HStack {
                ForEach(0..<5, id: \.self) { number in
                    Spacer()
                    Button(action: {
                        self.selectedIndex = number
                    }, label: {
                        Image(systemName: icons[number])
                            .font(.system(size: 25, weight: .regular, design: .default))
                            .foregroundColor(selectedIndex == number ? Color(.label) : .gray)
                    })
                    Spacer()
                }
            }
        }
    }
}

struct WebView: UIViewRepresentable {
    var url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
