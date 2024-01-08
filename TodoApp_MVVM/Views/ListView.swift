import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listviewmodel: ListviewModel
    
    var body: some View {
        
        ZStack {
            if listviewmodel.items.isEmpty {
                NotItemView().transition(.opacity.animation(.easeIn))
                
            } else {
                
                List {
                    ForEach(
                        listviewmodel.items
                    ) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                listviewmodel.updateItem(item: item)
                            }
                    }
                    .onDelete(
                        perform: listviewmodel.deleteItem
                    )
                    .onMove(
                        perform: listviewmodel.moveItem
                    )
                }
            }
        }
        
       
        .listStyle(
            PlainListStyle()
        )
        .navigationTitle(
            "Todo list 📝"
        )
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink(
                "Add",
                destination: AddView()
            )
        )
        
    }
    
    
}

#Preview {
    NavigationView{
        ListView()
    }
    .environmentObject(
        ListviewModel()
    )
    
}


