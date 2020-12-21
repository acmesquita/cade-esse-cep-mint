routes {
  / {
    Application.setPage(Page::Home)
  }

  * {
    Application.setPage(Page::NotFound)
  }
  
}
