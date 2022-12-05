##-----  Data  -----

## Getting the data in will be challenging

##-----  Problem 1  -----

stacks <- data.frame(
  row_1 = c("", "[N]", "[Z]"),
  row_2 = c("[D]", "[C]", "[M]"),
  row_3 = c("", "", "[P]")
)

instructions <- read_lines(
  c("move 1 from 2 to 1
move 3 from 1 to 3
move 2 from 2 to 1
move 1 from 1 to 2"
)) %>% as.data.frame


## Parse the instructions
instructions_df <- data.frame(
  num_boxes = str_extract_all(instructions$., pattern = "(?<=move )[0-9]", simplify = TRUE) %>% as.vector(),
  start_row = str_extract_all(instructions$., pattern = "(?<=from )[0-9]", simplify = TRUE) %>% as.vector(),
  end_row = str_extract_all(instructions$., pattern = "(?<=to )[0-9]", simplify = TRUE) %>% as.vector()
)


## Execute the movements






