component Show {
  connect ZipCode exposing { address, error }

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