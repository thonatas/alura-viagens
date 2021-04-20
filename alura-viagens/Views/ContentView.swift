//
//  ContentView.swift
//  alura-viagens
//
//  Created by Thonatas Borges on 30/12/20.
//

import SwiftUI

struct ContentView: View {

    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    var body: some View {
        NavigationView {
            GeometryReader { view in
                VStack {
                    HeaderView()
                        .frame(width: view.size.width, height: self.horizontalSizeClass == .compact ? 220 : 350, alignment: .top)
                    List(viagens) { viagem in
                        NavigationLink(destination: MapaView(coordenada: viagem.localizacao).navigationBarTitle("Localização")) {
                            CelulaViagemView(viagem: viagem)
                        }
                    }
                    .navigationBarTitle("")
                }
            }
            .edgesIgnoringSafeArea(.all)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//VStack = Vertical StackView
//HStack = Horizontal StackView
//ZStack = Elemento Sobre o Outro StackView
