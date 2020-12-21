component Show {
  connect ZipCode exposing { address }

  fun render : Html {
    <>
      <header>
        <FormZipCode />
      </header>
      <h1>
        <{ address }>
      </h1>
    </>
  }
}