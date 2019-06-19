filename <- system.file("sampledat/3.seq.ace", package = "ace2fastq")


lines <- readLines(filename)

n_of_contigs <- as.integer(stringr::str_split(lines[1], " ")[[1]][2])

n_CO <- which(stringr::str_starts(lines, "CO", ))
n_BQ <- which(stringr::str_starts(lines, "BQ"))


get_id <- function(start) {
  id <- stringr::str_trim(lines[start])
  return(id)
}

# get_seq

# get_qal

# make list for all seqs

# convert to fastq

# add option for compression of all files into 