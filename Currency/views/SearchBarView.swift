//
//  SearchBarView.swift
//  Currency
//
//  Created by yusef naser on 04/06/2023.
//

import UIKit
import SwiftUI

struct SearchBarView : UIViewRepresentable {
    
    @Binding var text : String
    
    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar()
        
        searchBar.searchBarStyle = .minimal
        searchBar.autocapitalizationType = .none
        searchBar.placeholder = "Search..."
        searchBar.delegate = context.coordinator
        
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
    }
    
    func makeCoordinator() -> CoordinatorSearchBar {
        CoordinatorSearchBar($text)
    }
    
}


class CoordinatorSearchBar : NSObject , UISearchBarDelegate {
    @Binding var text : String
    
    init(_ text : Binding<String> ) {
        self._text = text
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchBar.showsCancelButton = true
        text = searchText
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        text = ""
        searchBar.resignFirstResponder()
        searchBar.showsCancelButton = false
        searchBar.endEditing(true)
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.showsCancelButton = true
        return true
    }
    
}

