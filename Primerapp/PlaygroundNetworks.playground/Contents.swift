//: Playground - noun: a place where people can play

import UIKit
import AFNetworking

var str = "Hello, playground"

extension String {
    func reversa ()-> String{
        print ("Reversando")
        return "Hola"
    }
    
    func IntValue ()-> Int{
        return Int(self)!
    }
    
    func validar ()-> Bool{
        return self.characters.first == "A"
    }
}

    Int("0")
    "Hola".validar()
    "B".validar()
    "Alan".validar()
    
extension Int {
        func cuadrado() -> Int {
            return self * self
        }
    }
    3.cuadrado()

    extension UIImageView{
        func loadPicture(url : String){
            if  url.characters.count < 7{
                return
            }
            do{
                let dato = try Data(contentsOf: URL(string: url)!)
                self.image = UIImage(data: dato)
            }catch{
                print("Error: \(error)")
            }
        }
    }

var message1 = "Hello Swift! How can I get started?"
var message2 = "The best way to get started is to stop talking and code."

message1.uppercased()
message2.lowercased() + " Okay, I'm working on it  "

if message1 == message2{
    print("Es el mismo mensaje")
}else{
    print("No es el mismo mensaje")
}

let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
messageLabel.text = message1
messageLabel.backgroundColor = UIColor.blue
messageLabel.textColor = UIColor.white
messageLabel.textAlignment = NSTextAlignment.center
messageLabel.layer.cornerRadius = 10.0
messageLabel.clipsToBounds = true
messageLabel
