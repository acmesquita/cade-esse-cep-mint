module NormalizeZipCode {
  fun removeInvalidCaracter(zipCode: String): String {
    String.replace("-","", zipCode)
  }

  fun normalizeAddress(item: Address) : String {
    String.concat([item.street, ", ", item.neighborhood, ", ", item.city, " - ", item.state])
  }
}