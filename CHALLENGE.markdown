Challenge
=========

Create your own version of the `wc` command-line utility.

The `wc` utility displays the number of lines, words, and bytes contained in
each input file, as well as the names of the files specified.

A line is defined as a string of characters delimited by a newline character
(`\n`).

A word is defined as a string of characters delimited by one or more whitespace
characters (space, tab, or newline).

For example, if you run your program with a file named `example` that contains:

```
This is an example file
It has four lines
Fourteen words
And 70 bytes
```

Your program should produce the following output:

```
       4      14      70 example
```

If more than one input file is specified, a line of cumulative counts for all
the files is displayed on a separate line, after the output for the last file,
with `total` in place of the file name.

```sh
wc example haiku
```
```
       4      14      70 example
       3       8      39 haiku
       7      22     109 total
```

The `wc` utility has various other options, which you should try to implement,
if you have time.

For example, `wc -w file` outputs only the number of words in `file`
(suppressing the line count and byte count).

For more information on the features of `wc`, you can [read the manual][man]:

[man]: wc.txt

```
man wc
```

Assessment
----------

Submissions will be evaluated on the following criteria:

<table>
  <tr>
    <th>Fidelity</td>
    <td>Does the program work as specified? How closely does its behavior match <code>wc</code>?</td>
  </tr>
  <tr>
    <th>Readability &amp; Style</th>
    <td>How easy is the code to read and understand? Does it use a consistent style (e.g. indentation)? Do variables have clear, descriptive names?</td>
  </tr>
  <tr>
    <th>Maintainability &amp; Design</th>
    <td>Is the code logically organized into classes, modules, and methods? How easy would it be to add a new feature to your program?</td>
  </tr>
  <tr>
    <th>Test Quality &amp; Coverage</th>
    <td>How comprehensively is the program tested? Would someone be able to refactor the code with confidence?</td>
  </tr>
  <tr>
    <th>Robustness</th>
    <td>Can the program handle invalid or very large input without crashing?</td>
  </tr>
  <tr>
    <th>Performance</th>
    <td>How fast and memory efficient is the program?</td>
  </tr>
</table>

Some example files are provided in the [`examples`][examples] directory for
your convenience but feel free to create your own files to test your program.

[examples]: examples

**Note**: A character may occupy a single byte (e.g. ASCII characters, such as
`a`, `1`, `!`, `$`, space, or newline) or multiple bytes (e.g. non-ASCII
characters such as `ß`, `å`, `é`, `¡`, `€`, `ツ` or `🌴`), depending on the
encoding. At the beginning, it may be easier to work only with ASCII-encoded
files, where each character is one byte.
