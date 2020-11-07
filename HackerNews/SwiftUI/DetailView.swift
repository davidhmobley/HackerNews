//
//  DetailView.swift
//  HackerNews
//
//  Created by David Mobley on 11/6/20.
//

import SwiftUI

struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com").previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro"))
    }
}
