//
//  ContentView.swift
//  MarkdownPreviewer
//
//  Created by Jason Goodney on 7/17/20.
//

import SwiftUI
import Down

class MarkdownStore: ObservableObject {
    @Published var markdown = Examples.fCCMarkdownPreviewerSample.markdown
    @Published var markdownAttributedString = NSAttributedString(string: "")
    
    
//    var markdownAttributedString: NSAttributedString {
//        let down = Down(markdownString: markdown)
//        if let attributedString = try? down.toAttributedString() {
//            return attributedString
//        }
//
//        return NSAttributedString(string: "Failed to parse markdown")
//    }
}

struct ContentView: View {
    @ObservedObject var store = MarkdownStore()

    @State private var showingEditor = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                TextWithAttributedString(attributedString: $store.markdownAttributedString)
                    .padding()
            }
            .navigationTitle("MD Previewer")
            .navigationBarItems(trailing: Button("Editor") {
                self.showingEditor = true
            })
            .sheet(isPresented: $showingEditor, onDismiss: {
                setMarkdownAttributedString(from: store.markdown)
            }) {
                EditorView(store: store)
            }
            .onAppear {
                setMarkdownAttributedString(from: store.markdown)
            }
            
        }
        
    }
    
    func setMarkdownAttributedString(from string: String) {
        let down = Down(markdownString: string)
        if let attributedString = try? down.toAttributedString() {
            store.markdownAttributedString = attributedString
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//https://stackoverflow.com/users/971329/blackjacx
struct TextWithAttributedString: UIViewRepresentable {

    @Binding var attributedString: NSAttributedString

    func makeUIView(context: Context) -> ViewWithLabel {
        let view = ViewWithLabel(frame: .zero)
        return view
    }

    func updateUIView(_ uiView: ViewWithLabel, context: Context) {
        uiView.setString(attributedString)
    }
}

class ViewWithLabel : UIView {
    private var label = UILabel()

    override init(frame: CGRect) {
        super.init(frame:frame)
        self.addSubview(label)
        label.numberOfLines = 0
        label.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setString(_ attributedString:NSAttributedString) {
        self.label.attributedText = attributedString
    }

    override var intrinsicContentSize: CGSize {
        label.sizeThatFits(CGSize(width: UIScreen.main.bounds.width - 50, height: 9999))
    }
}
