store ZipCode {

  state zipCode : String = ""
  state address : String = ""

  fun findZipCode( zipCode: String ) : Promise(Never, Void) {
    next { address = "Rua das flores"}
  }
  
}