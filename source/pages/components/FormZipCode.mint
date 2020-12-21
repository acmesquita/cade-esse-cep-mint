component FormZipCode {
  connect ZipCode exposing { findZipCode }
  connect Application exposing { setPage }
  
  state value : String = ""

  fun handleInput (event : Html.Event) : Promise(Never, Void) {
    next { value = Dom.getValue(event.target) }
  }

  fun handleSubmit (event : Html.Event ) : Promise(Never, Void) {
    sequence {
      Html.Event.preventDefault(event)

      findZipCode(value)

      setPage(Page::Show)
    }
  }

  fun render : Html {
    <form onSubmit={handleSubmit}>
      <input value={value} onInput={handleInput}/>
      <button disabled={String.isEmpty(value)}>
        <{ "Send" }>
      </button>
    </form>
  } 
}