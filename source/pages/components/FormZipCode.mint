component FormZipCode {
  connect ZipCode exposing { findZipCode, error, cleanError }
  connect Application exposing { setPage }
  
  state value : String = ""

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
        <input value={value} onInput={handleInput}/>
        <button disabled={String.isEmpty(value)}>
          <{ "Send" }>
        </button>
      </form>
      <p><{ error }></p>
    </>
  } 
}