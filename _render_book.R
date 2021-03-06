## rendering naar een of meerdere van de onderstaande formats

require(rmarkdown)
require(tufte)
require(bookdown)

# gitbook formatted html pages (gebruikt op testpagina)
bookdown::render_book("index.Rmd", output_format = bookdown::gitbook(output_dir = "docs", new_session = T, clean_envir = T)

# tufte style html pages (accepts no more than 2-level sections)
# bookdown::render_book("index.Rmd", output_format = bookdown::tufte_html_book(split_by = "chapter"),
                      # output_dir = "tufte_book", new_session = T, clean_envir = T)


# "normal pdf
# options(tinytex.verbose = TRUE)
# file.remove("_main.md")
# bookdown::render_book("index.Rmd", output_format = bookdown::pdf_book(),
#                       new_session = T, clean_envir = T)


# tufte pdf (accepts no more than 2-level sections)
# bookdown::render_book("index.Rmd", output_format = bookdown::tufte_book2(),
#                       output_dir = "tufte_book", new_session = T, clean_envir = T)

# Veel gemaakte fouten
# Figuurlabels (label in code block) mogen geen underscore (_) bevatten bij rendering naar pdf
# Dubbele labels mogen niet (door hele document, alle hoofdstukken)
# Tufte output laat maar 2 niveau's toe (chapters # en sections ##)
# gebruik geen \\ als directory afscheiding. Gaat niet goed van latex naar pdf
