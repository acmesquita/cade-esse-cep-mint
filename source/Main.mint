component Main {
  connect Application exposing { page }

  fun render : Html {
    <>
      case (page) {
        Page::NotFound => <div>"404"</div>
        Page::Home => <Home />
        Page::Show => <Show />
      }
    </>
  }
}