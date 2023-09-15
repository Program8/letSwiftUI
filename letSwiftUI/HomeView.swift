//
//  HomeView.swift
//
//
//  Created by Vijay Sachan on 15/09/23.
//
import SwiftUI
private struct ListData:Identifiable{
    let title: String
    var contentView: AnyView
    var id: String { title }
}
struct HomeView: View {
    @State var searchText=""
    var body: some View{
            let list=List{
                ForEach(filteredArr()) { listData in
                    NavigationLink(destination: listData.contentView.navigationTitle(listData.title),label:{
                        Text(listData.title)
                    })
                }
            }.navigationTitle("Home").navigationBarTitleDisplayMode(.large)
            list.searchable(text: $searchText)
        
    }
     fileprivate func filteredArr()-> [ListData]{
        if searchText.isEmpty {
            return HomeView.arr
        } else {
            return HomeView.arr.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        }
        }
    private static var allArr=[ListData]()
    fileprivate static var arr:[ListData]{
        get{
            if allArr.isEmpty{
                allArr.append(ListData(title:"Button",contentView: AnyView(ButtonView())))
                // Sort array by ascending order
                allArr = allArr.sorted(by: { $0.title < $1.title })
            }
            return allArr
        }
    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let view=HomeView()
        if #available(iOS 16.0, *) {
            NavigationStack{
                view
            }
        } else {
            // Fallback on earlier versions
            NavigationView{
                view
            }
        }
    }
}
