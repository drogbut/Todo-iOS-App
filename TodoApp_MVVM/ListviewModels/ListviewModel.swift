import Foundation

class ListviewModel: ObservableObject {
    
    /* @Published est utilisé dans le contexte des objets observables pour permettre
    * la mise à jour automatique des vues lorsque les données changent. Notez que
    * @Published est souvent utilisé avec des objets conformes à ObservableObject.
     */
    @Published var items: [ItemModel] = []{
        didSet{
            saveItems()
        }
    }
    
    let itemsKey: String = "item_key"
    
    //--------------------------------------------------------------
    init() {
        getItems()
    }
    
    //--------------------------------------------------------------
    func getItems(){
        guard
            // Décodage (conversion du JSON en instance de la classe)
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let saveItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.items = saveItems
                
    }
    
    //--------------------------------------------------------------
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    //--------------------------------------------------------------
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    //--------------------------------------------------------------
    func addItem(title: String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    //--------------------------------------------------------------
    func updateItem(item: ItemModel){
        if let index = items.firstIndex(where: { $0.id == item.id}){
            items[index] = item.updateICompletion()
        }
    }
    
    //--------------------------------------------------------------
    /*
     * UserDefaults est une classe qui est utilisée pour stocker de petites
     * quantités de données de manière persistante.
     */
    func saveItems(){
        // Encodage (conversion en JSON)
        if let encodeData = try? JSONEncoder().encode(items){
            UserDefaults.standard.setValue(encodeData, forKey: itemsKey)
        }
    }
}
