//
//  ChatView.swift
//  Molnito
//
//  Created by 예은 on 2022/07/19.
//

import SwiftUI

struct ChatView: View {
    @State private var messageText = ""
    @State var messages: [String] = []
    
    var body: some View {
         //ResultList()
        VStack{
            HStack{
                Text("Chat")
                    .font(.largeTitle)
                    .bold()
                
                Image(systemName: "bubble.left")
                    .font(.system(size: 26))
                    .foregroundColor(.black)
//                    .foregroundColor(Color("hanyangBlue"))
            }
            
            
            ScrollView{
                ForEach(messages, id: \.self){ message in
//                    Text(message)
                    if message.contains("[USER]"){
                        let newMessage = message.replacingOccurrences(of: "[USER]", with: "")
                        
                        HStack{
                            Spacer()
                            Text(newMessage)
                                .padding()
                                .foregroundColor(.black)
                                .background(.gray.opacity(0.17))
                                .cornerRadius(10)
                                .padding(.horizontal, 16)
                                .padding(.bottom, 10)
                        }
                    } else {
                        HStack{
                            Text(message)
                                .padding()
                                .foregroundColor(.white)
                                .background(.black.opacity(0.85))
                                .cornerRadius(10)
                                .padding(.horizontal, 16)
                                .padding(.bottom, 10)
                            
                            Spacer()
                        }
                    }
                    
                }.rotationEffect(.degrees(180))
            }.rotationEffect(.degrees(180))
                .background(Color.gray.opacity(0.08))
            
            HStack{
                TextField("메세지를 입력하세요", text: $messageText)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .onSubmit {
                        sendMessage(message: messageText)
                    }
                
                Button{
                    sendMessage(message: messageText)
                } label: {
                    Image(systemName: "paperplane")
                        .foregroundColor(.black)
                }
                .font(.system(size: 26))
                .padding(.horizontal, 10)
            }
            .padding()
        }
    }
    
    func sendMessage(message: String){
        withAnimation{
            messages.append("[USER]" + message)
            self.messageText = ""
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            withAnimation {
                messages.append(getBotResponse(message: message))
            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
