component FormZipCode {
  connect ZipCode exposing { findZipCode, error, cleanError, zipCode }
  connect Application exposing { setPage }
  
  state value : String = zipCode

  fun handleInput (event : Html.Event) : Promise(Never, Void) {
    next { value = Dom.getValue(event.target) }
  }

  fun handleSubmit (event : Html.Event ) : Promise(Never, Void) {
    sequence {
      Html.Event.preventDefault(event)
      
      cleanError()
      
      findZipCode(value)

      if(String.isEmpty(error)){
        setPage(Page::Show)
      }else {
        setPage(Page::Home)
      }
    }
  }

  fun render : Html {
    <>
      <form onSubmit={handleSubmit}>
        <input value={value} onInput={handleInput} placeholder="01000-000"/>
        <button disabled={String.isEmpty(value)}>
          <{ ">" }>
        </button>
      </form>
      <p><{ error }></p>
    </>
  } 
}