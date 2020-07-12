//
//  SwiftUIView.swift
//  learn_coredata
//
//  Created by tientran on 7/12/20.
//  Copyright © 2020 tientran. All rights reserved.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        HStack{
            Text("hello")

            Button(action: {
                print("red")
            }){
                Text("Xoá")
            }
            .padding(.all,10)
            .background(Color.red)
            .foregroundColor(.white)
            
            Button(action: {
              print("blue")
            }){
                Text("Sửa")
            }
            .padding(.all,10)
            .background(Color.green)
            .foregroundColor(.white)
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
