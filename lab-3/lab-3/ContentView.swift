//
//  ContentView.swift
//  lab3
//
//  Created by user on 04.11.2021.
//

import SwiftUI
struct ContentView: View {

@State private var firstName : String = ""
@State private var lastName : String = ""
@State private var email : String = ""
@State private var phone : String = ""
@State private var password : String = ""
@State private var confirmPassword : String = ""

@State private var errorName  : String = ""
@State private var isError  : Bool = false
    
    
func falidateFields (){
    if(self.firstName.count == 0 ){
        self.isError = true
        self.errorName = "first name can not be empty"
    }else if(self.lastName.count == 0){
        self.isError = true
        self.errorName = "last name can not be empty"
    }else if(!textFieldValidatorEmail(email)){
        self.isError = true
        self.errorName = "Email is not valid"
    }else if(validatePhone(phone)){
        self.isError = true
        self.errorName = "Phone is not valid"
    }else if(!validatePassword(password)){
        self.isError = true
        self.errorName = "Password is not valid"
    }else if(password != confirmPassword){
        self.isError = true
        self.errorName = "passwords is not the same"
    }
    else {
        self.isError = false
    }
   
}

var body: some View {
    VStack {
        TextField("First name", text: $firstName)
            .padding(10)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
        TextField("Last name", text: $lastName)
            .padding(10)
            .border(Color.black)
        TextField("Email", text: $email)
            .padding(10)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
        TextField("Phone", text: $phone)
            .padding(10)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
        TextField("Password", text: $password)
            .padding(10)
            .border(Color.black)
        TextField("Confirm password", text: $confirmPassword)
            .padding(10)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            

        if self.isError {
            Text(errorName)
                .foregroundColor(Color.red)
        }
        
        Spacer()
        
        Button(action: falidateFields, label: {
            /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
        })
    }
}
    
    
func validatePhone(_ value: String) -> Bool {
        let PHONE_REGEX = "^\\d{3}-\\d{3}-\\d{4}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result = phoneTest.evaluate(with: value)
        return result
    }
func validatePassword(_ value: String) -> Bool {
        let PASSWORD_REGEX = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", PASSWORD_REGEX)
        let result = passwordTest.evaluate(with: value)
        return result
    }
func textFieldValidatorEmail(_ string: String) -> Bool {
    if string.count > 100 {
        return false
    }
    let emailFormat = "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" + "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" + "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" + "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" + "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" + "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" + "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
    let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
    return emailPredicate.evaluate(with: string)
}}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
