#' @title build_testplan
#' @description FUNCTION_DESCRIPTION
#' @param pkgdir PARAM_DESCRIPTION
#' @param deps PARAM_DESCRIPTION, Default: FALSE
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples
#' \dontrun{
#' #EXAMPLE1
#'  }
#' @rdname build_testplan
#' @export
#' @author Lorenzo Busetto, phD (2017) <lbusett@gmail.com>
#' @importFrom devtools load_all
#' @importFrom stringr str_split_fixed
#' @importFrom fs path_ext_remove
#' @importFrom drake drake_config
#' @importFrom magrittr '%>%'
#' @export '%>%'
build_testplan <- function(pkgdir, deps = FALSE) {

  #   ____________________________________________________________________________
  #   Get the environment of the package and the test files names             ####
  #   (Assuming unit tests built according to testthat standards)

  # env <- devtools::load_all(pkgdir)$env
  test_files <- list.files(
    file.path(pkgdir, "tests/testthat"), pattern    = ".R",
    full.names = TRUE)

  if (!deps) {

    # "Vanilla" plan - only allows parallelization of testst - no checks done
    # on changes in package functions or imports - needs to be invalidated
    # after each run!
    #
    target_names <- basename(test_files) %>%
      stringr::str_split_fixed("_", n = 2) %>% .[,2] %>%
      fs::path_ext_remove()

    target_commands <- paste0("testthat::test_file('",
                              test_files,
                              "')")
    testplan_tests <- data.frame(target = target_names,
                                 command = target_commands)
    bind <-  paste0("base::rbind(",
                             paste(target_names, collapse = ", "),
                             ")",collapse = "")

    testplan_bind <- data.frame(target = "alltests",
                                command = bind)
    # testplan_list <- list()
    # for (test in seq_along(testplan_tests)) {
    #   testplan_list[[target_names[test]]] <- target_commands[test]
    #   }
# browser()
    testplan <- base::rbind(testplan_tests,testplan_bind)
    # testplan <- drake::drake_config(testplan_tests)

  }

  report <- data.frame(target = 'test_report.html',
                       command = "rmarkdown::render(input = 'R/test_report.Rmd',
output_file = 'test_report.html', quiet = TRUE)")

  testplan <- rbind(testplan, report)
  testplan
}

