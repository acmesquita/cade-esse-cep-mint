component Show {
  connect ZipCode exposing { address, error }
  connect Application exposing { setPage }

  style header {
    display: flex;
    justify-content: space-around;
    align-items: center;
    width: 100%;
    height: 15vh;
  }

  style main {
    width: min(1024px, 100vw);
    margin: 30px auto;
  }

  style cursor {
    cursor: pointer;
  }

  fun goToHome() {
    setPage(Page::Home)
  }


  fun render : Html {
    <>
      <header::header>
        <h1::cursor onClick={goToHome}>"Cadê esse CEP?"</h1>
        <FormZipCode />
      </header>
      <main::main>
        <p>"Endereço"</p>
        <h3>
          <{ address }>
        </h3>
      </main>
    </>
  }
}