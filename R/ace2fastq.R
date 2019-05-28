
#' ace_to_fastq
#'
#' @param filename .ace file
#' @param target_dir target directory
#' @param name2id use the file name as primary id or not. Default is TRUE.
#' @import stringr
#' @return target file name
#' @author Reinhard Simon
#' @export
#'
#' @examples
#' if(interactive()) {
#'   library(ace2fq)
#'   filename <- system.file("sampledat/1.seq.ace", package = "ace2fq")
#'   ace_to_fastq(filename)
#' }
#'
#'
ace_to_fastq <- function(filename, target_dir = dirname(filename), name2id = TRUE) {

  lines <- readLines(filename)

  # read and combine sequences
  id <- stringr::str_trim(lines[3])
  eofq <- which(lines == "")[2]
  seqs <- paste(lines[4:eofq], collapse = "")

  # read, combine, and transform quality values
  svls <- eofq + 2
  evls <- which(lines == "")[3]
  qvls <- paste( lines[svls:evls], collapse = "")
  qvls <- stringr::str_split(stringr::str_trim(qvls), " ")
  qvls <- as.integer(qvls[[1]]) + 33
  qvls <- paste(sapply(qvls, intToUtf8), collapse = "")

  # prepare id line
  filebase <- stringr::str_replace(basename(filename), ".ace", "")
  if (name2id) {
    id <- paste("@", filebase, " ", id)
  } else {
    id <- paste("@", id)
  }

  # prepare resulting final fastq lines
  txt <- character(4)
  txt[1] <- id
  txt[2] <- seqs
  txt[3] <- "+"
  txt[4] <- qvls

  # write fastq
  target_name <- file.path(target_dir, paste0(filebase, ".fastq"))
  writeLines(text = txt, con = target_name)

  return(target_name)
}


