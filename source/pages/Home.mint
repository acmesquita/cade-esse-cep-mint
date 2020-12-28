component Home {

  style main {
    display: flex;
    justify-content: space-around;
    align-items: center;
    width: 100%;
    height: 50vh;
  }

  style title {
    display: flex;
    flex-direction: column;
    gap: 10px;
  }

  fun render : Html {
    <main::main>
      <div::title>
        <h1>"Cadê esse CEP?"</h1>
        <h3>
          "Digite o CEP que está buscando e descubra o Brasil."
        </h3>
      </div>
      <FormZipCode />
    </main>
  }
}