import SwiftUI

@main
struct TodoApp_MVVMApp: App {
    
    /*
     * (1) @StateObject est utilisé pour gérer la création et la durée de vie d'un objet
     * conforme à ObservableObject.
     *
     * (2) Lorsqu'un objet conforme à ObservableObject est placé dans l'environnement avec
     * environmentObject, toutes les vues de l'application peuvent y accéder et observer
     * les changements dans cet objet
     */
    @StateObject var listViewModel: ListviewModel = ListviewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
            
        }
    }
}
