store ZipCode {
  state zipCode : String = ""
  state address : String = ""
  state error : String = ""

  fun findZipCode( zipCode: String ) : Promise(Never, Void) {
    zipCode
      |> NormalizeZipCode.removeInvalidCaracter
      |> ValidateZipCode.lenght
      |> findAddressBy
  }
  
  fun updateAddress(param : Tuple(String, String)): Promise(Never, Void) {
    case(param) {
      {status, msg } => if(status == "ok") { next { address = msg} } else { next { error = msg } }
    }
  }

  fun cleanError : Promise(Never, Void)  {
    next { error = "" }
  }

  fun findAddressBy(param : Tuple(String, String)) : Promise(Never, Void) {
    case(param) {
      {status, msg } => if(status == "ok") {
        sequence {
          response = "https://brasilapi.com.br/api/cep/v1/#{msg}"
            |> Http.get()
            |> Http.send()

          object =
              response.body
              |> Json.parse()
              |> Maybe.toResult("")

          decodedResults = decode object as Address

          next { address = NormalizeZipCode.normalizeAddress(decodedResults)}
        } catch Http.ErrorResponse => msgError {
          sequence {
            Debug.log(msgError)
            next { error = "Erro inesperado" }
          }
        }
        catch String => msgError {
          sequence {
            Debug.log(msgError)
            next { error = "Erro inesperado" }
          }
        }
        catch Object.Error => msgError {
          sequence {
            Debug.log(msgError)
            next { error = "Erro inesperado" }
          }
        }
      }else {
        next { error = msg }
      }
    }
  }
}