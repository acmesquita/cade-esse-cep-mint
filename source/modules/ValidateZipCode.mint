module ValidateZipCode {
  fun lenght(zipCode: String) : Tuple(String, String){
    if (String.size(zipCode) == 8){
      {"ok", zipCode}
    } else {
      {"error", "Valor invalido."}
    }
  }
}