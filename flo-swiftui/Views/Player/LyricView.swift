//
//  LyricView.swift
//  flo-swiftui
//
//  Created by 영현 on 3/19/24.
//

import SwiftUI

struct LyricView: View {
    @StateObject var viewModel: PlayerViewModel = PlayerViewModel.shared
    @Environment(\.dismiss) var dismiss
    let background = Color.black
    
    var body: some View {
        ZStack {
            background
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Text(viewModel.title)
                        .font(.title3)
                        .foregroundColor(.white)
                        .padding(.bottom, 1)
                    
                    Spacer()
                    
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .imageScale(.large)
                            .foregroundColor(.white)
                    }
                }
                .padding(.horizontal)
                
                HStack {
                    Text(viewModel.singer)
                        .foregroundColor(.white)
                        .padding(.bottom, 16)
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(viewModel.lyrics.indices, id: \.self) { index in
                            Text(viewModel.lyrics[index].text)
                                .foregroundColor(index == viewModel.currentLyricIndex ? .white : .gray)
                                .onTapGesture {
                                    let selectedLyricTime = viewModel.lyrics[index].time
                                    viewModel.seek(to: selectedLyricTime)
                                }
                        }
                    }
                }
                .padding(.horizontal)
                
                PlayerProgressView()
                    .padding(.horizontal)
                
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    LyricView()
}
