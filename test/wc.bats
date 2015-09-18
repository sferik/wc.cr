#!/usr/bin/env bats

COMMAND=${COMMAND:-./bin/wc}

@test "counts lines, words, and bytes when invoked with one file" {
  run $COMMAND test/examples/example
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "       4      14      70 test/examples/example" ]
}

@test "counts lines, words, and bytes when invoked with multiple files" {
  run $COMMAND test/examples/example test/examples/utf8
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "       4      14      70 test/examples/example" ]
  [ "${lines[1]}" = "       1       8      79 test/examples/utf8" ]
  [ "${lines[2]}" = "       5      22     149 total" ]
}

@test "counts lines, words, and bytes when invoked with stdin" {
  run $COMMAND < test/examples/example
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "       4      14      70" ]
}

@test "counts bytes when invoked with the -c flag and one file" {
  run $COMMAND -c test/examples/example
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "      70 test/examples/example" ]
}

@test "counts bytes when invoked with the -c flag and multiple files" {
  run $COMMAND -c test/examples/example test/examples/utf8
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "      70 test/examples/example" ]
  [ "${lines[1]}" = "      79 test/examples/utf8" ]
  [ "${lines[2]}" = "     149 total" ]
}

@test "counts bytes when invoked with the -c flag and stdin" {
  run $COMMAND -c < test/examples/example
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "      70" ]
}

@test "counts lines when invoked with the -l flag and one file" {
  run $COMMAND -l test/examples/example
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "       4 test/examples/example" ]
}

@test "counts lines when invoked with the -l flag and multiple files" {
  run $COMMAND -l test/examples/example test/examples/utf8
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "       4 test/examples/example" ]
  [ "${lines[1]}" = "       1 test/examples/utf8" ]
  [ "${lines[2]}" = "       5 total" ]
}

@test "counts lines when invoked with the -l flag and stdin" {
  run $COMMAND -l < test/examples/example
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "       4" ]
}

@test "counts characters when invoked with the -m flag and one file" {
  run $COMMAND -m test/examples/utf8
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "      50 test/examples/utf8" ]
}

@test "counts characters when invoked with the -m flag and multiple files" {
  run $COMMAND -m test/examples/example test/examples/utf8
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "      70 test/examples/example" ]
  [ "${lines[1]}" = "      50 test/examples/utf8" ]
  [ "${lines[2]}" = "     120 total" ]
}

@test "counts characters when invoked with the -m flag and stdin" {
  run $COMMAND -m < test/examples/utf8
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "      50" ]
}

@test "counts words when invoked with the -w flag and one file" {
  run $COMMAND -w test/examples/example
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "      14 test/examples/example" ]
}

@test "counts words when invoked with the -w flag and multiple files" {
  run $COMMAND -w test/examples/example test/examples/utf8
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "      14 test/examples/example" ]
  [ "${lines[1]}" = "       8 test/examples/utf8" ]
  [ "${lines[2]}" = "      22 total" ]
}

@test "counts words when invoked with the -w flag and stdin" {
  run $COMMAND -w < test/examples/example
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "      14" ]
}

@test "counts bytes and lines when invoked with the -c and -l flags and one file" {
  run $COMMAND -c -l test/examples/example
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "       4      70 test/examples/example" ]
}

@test "counts bytes and lines when invoked with the -c and -l flags and multiple files" {
  run $COMMAND -c -l test/examples/example test/examples/utf8
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "       4      70 test/examples/example" ]
  [ "${lines[1]}" = "       1      79 test/examples/utf8" ]
  [ "${lines[2]}" = "       5     149 total" ]
}

@test "counts bytes and lines when invoked with the -c and -l flags and stdin" {
  run $COMMAND -c -l < test/examples/example
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "       4      70" ]
}

@test "counts characters when invoked with the -c and -m flags and one file" {
  run $COMMAND -c -m test/examples/example
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "      70 test/examples/example" ]
}

@test "counts characters when invoked with the -c and -m flags and multiple files" {
  run $COMMAND -c -m test/examples/example test/examples/utf8
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "      70 test/examples/example" ]
  [ "${lines[1]}" = "      50 test/examples/utf8" ]
  [ "${lines[2]}" = "     120 total" ]
}

@test "counts characters when invoked with the -c and -m flags and stdin" {
  run $COMMAND -c -m < test/examples/example
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "      70" ]
}

@test "counts bytes and words when invoked with the -c and -w flags and one file" {
  run $COMMAND -c -w test/examples/example
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "      14      70 test/examples/example" ]
}

@test "counts bytes and words when invoked with the -c and -w flags and multiple files" {
  run $COMMAND -c -w test/examples/example test/examples/utf8
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "      14      70 test/examples/example" ]
  [ "${lines[1]}" = "       8      79 test/examples/utf8" ]
  [ "${lines[2]}" = "      22     149 total" ]
}

@test "counts bytes and words when invoked with the -c and -w flags and stdin" {
  run $COMMAND -c -w < test/examples/example
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "      14      70" ]
}

@test "counts lines and characters when invoked with the -l and -m flags and one file" {
  run $COMMAND -l -m test/examples/example
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "       4      70 test/examples/example" ]
}

@test "counts lines and characters when invoked with the -l and -m flags and multiple files" {
  run $COMMAND -l -m test/examples/example test/examples/utf8
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "       4      70 test/examples/example" ]
  [ "${lines[1]}" = "       1      50 test/examples/utf8" ]
  [ "${lines[2]}" = "       5     120 total" ]
}

@test "counts lines and characters when invoked with the -l and -m flags and stdin" {
  run $COMMAND -l -m < test/examples/example
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "       4      70" ]
}

@test "counts lines and words when invoked with the -l and -w flags and one file" {
  run $COMMAND -l -w test/examples/example
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "       4      14 test/examples/example" ]
}

@test "counts lines and words when invoked with the -l and -w flags and multiple files" {
  run $COMMAND -l -w test/examples/example test/examples/utf8
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "       4      14 test/examples/example" ]
  [ "${lines[1]}" = "       1       8 test/examples/utf8" ]
  [ "${lines[2]}" = "       5      22 total" ]
}

@test "counts lines and words when invoked with the -l and -w flags and stdin" {
  run $COMMAND -l -w < test/examples/example
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "       4      14" ]
}

@test "counts characters and words when invoked with the -m and -w flags and one file" {
  run $COMMAND -m -w test/examples/example
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "      14      70 test/examples/example" ]
}

@test "counts characters and words when invoked with the -m and -w flags and multiple files" {
  run $COMMAND -m -w test/examples/example test/examples/utf8
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "      14      70 test/examples/example" ]
  [ "${lines[1]}" = "       8      50 test/examples/utf8" ]
  [ "${lines[2]}" = "      22     120 total" ]
}

@test "counts characters and words when invoked with the -m and -w flags and stdin" {
  run $COMMAND -m -w < test/examples/example
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "      14      70" ]
}

@test "counts characters and lines when invoked with the -c, -l, and -m flags and one file" {
  run $COMMAND -c -l -m test/examples/example
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "       4      70 test/examples/example" ]
}

@test "counts characters and lines when invoked with the -c, -l, and -m flags and multiple files" {
  run $COMMAND -c -l -m test/examples/example test/examples/utf8
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "       4      70 test/examples/example" ]
  [ "${lines[1]}" = "       1      50 test/examples/utf8" ]
  [ "${lines[2]}" = "       5     120 total" ]
}

@test "counts characters and lines when invoked with the -c, -l, and -m flags and stdin" {
  run $COMMAND -c -l -m < test/examples/example
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "       4      70" ]
}

@test "counts bytes, lines, and words when invoked with the -c, -l, and -w flags and one file" {
  run $COMMAND -c -l -w test/examples/example
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "       4      14      70 test/examples/example" ]
}

@test "counts bytes, lines, and words when invoked with the -c, -l, and -w flags and multiple files" {
  run $COMMAND -c -l -w test/examples/example test/examples/utf8
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "       4      14      70 test/examples/example" ]
  [ "${lines[1]}" = "       1       8      79 test/examples/utf8" ]
  [ "${lines[2]}" = "       5      22     149 total" ]
}

@test "counts bytes, lines, and words when invoked with the -c, -l, and -w flags and stdin" {
  run $COMMAND -c -l -w < test/examples/example
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "       4      14      70" ]
}

@test "counts characters and words when invoked with the -c, -m, and -w flags and one file" {
  run $COMMAND -c -m -w test/examples/example
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "      14      70 test/examples/example" ]
}

@test "counts characters and words when invoked with the -c, -m, and -w flags and multiple files" {
  run $COMMAND -c -m -w test/examples/example test/examples/utf8
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "      14      70 test/examples/example" ]
  [ "${lines[1]}" = "       8      50 test/examples/utf8" ]
  [ "${lines[2]}" = "      22     120 total" ]
}

@test "counts characters and words when invoked with the -c, -m, -w flags and stdin" {
  run $COMMAND -c -m -w < test/examples/example
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "      14      70" ]
}

@test "counts characters, lines, and words when invoked with the -l, -m, and -w flags and one file" {
  run $COMMAND -l -m -w test/examples/example
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "       4      14      70 test/examples/example" ]
}

@test "counts characters, lines, and words when invoked with the -l, -m, and -w flags and multiple files" {
  run $COMMAND -l -m -w test/examples/example test/examples/utf8
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "       4      14      70 test/examples/example" ]
  [ "${lines[1]}" = "       1       8      50 test/examples/utf8" ]
  [ "${lines[2]}" = "       5      22     120 total" ]
}

@test "counts characters, lines, and words when invoked with the -l, -m, and -w flags and stdin" {
  run $COMMAND -l -m -w < test/examples/example
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "       4      14      70" ]
}

@test "counts characters, lines, and words when invoked with the -c, -l, -m, and -w flags and one file" {
  run $COMMAND -c -l -m -w test/examples/example
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "       4      14      70 test/examples/example" ]
}

@test "counts characters, lines, and words when invoked with the -c, -l, -m, and -w flags and multiple files" {
  run $COMMAND -c -l -m -w test/examples/example test/examples/utf8
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "       4      14      70 test/examples/example" ]
  [ "${lines[1]}" = "       1       8      50 test/examples/utf8" ]
  [ "${lines[2]}" = "       5      22     120 total" ]
}

@test "counts characters, lines, and words when invoked with the -c, -l, -m, and -w flags and stdin" {
  run $COMMAND -c -l -m -w < test/examples/example
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "       4      14      70" ]
}

@test "displays usage information when invoked with the -h flag" {
  run $COMMAND -h
  [ "${lines[0]}" = "usage: wc [-chlw] [file ...]" ]
  [ "${lines[1]}" = "    -c, --bytes                      Write to the standard output the number of bytes in each input file." ]
  [ "${lines[2]}" = "    -l, --lines                      Write to the standard output the number of lines in each input file." ]
  [ "${lines[3]}" = "    -m, --chars                      Write to the standard output the number of characters in each input file." ]
  [ "${lines[4]}" = "    -w, --words                      Write to the standard output the number of words in each input file." ]
  [ "${lines[5]}" = "    -h, --help                       Show this help" ]
}

@test "adds extra padding before numbers with 8 or more digits" {
  run $COMMAND < test/examples/ten_million_lines
  [ "${lines[0]}" = " 10000000       0 10000000" ]
}

@test "doesn't crash when invoked with binary data" {
  run $COMMAND < test/examples/binary
  [ "$status" -eq 0 ]
}

@test "doesn't crash when invoked with an empty file" {
  run $COMMAND < test/examples/blank
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "       0       0       0" ]
}

@test "errs when invoked with a nonexistent file" {
  run $COMMAND nonexistent_filename
  [ "$status" -eq 1 ]
}

@test "counts tabs as word separators" {
  result="$($COMMAND -w < test/examples/tabs)"
  [ "$result" -eq 5 ]
}

@test "must be 50 lines or less" {
  result="$($COMMAND -l < src/wc.cr)"
  [ "$result" -le 50 ]
}
