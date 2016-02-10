require "option_parser"

def counts(text, options)
  row = [] of Int32
  row << text.lines.size if options[:lines]
  row << text.split.size if options[:words]
  if options[:chars]
    row << text.chars.size
  elsif options[:bytes]
    row << text.bytes.size
  end
  row
end

def totals(cols)
  cols.map(&.reduce(0) { |sum, n| sum += n })
end

def print_row(row, label = nil)
  row.each do |col|
    width = [col.to_s.size + 1, 8].max
    print col.to_s.rjust(width)
  end
  print " #{label}" if label
  print "\n"
end

options = Hash(Symbol, Bool).new { |h, v| h[v] = false }
OptionParser.new do |opts|
  opts.banner = "usage: wc [-chlw] [file ...]"
  opts.on("-c", "--bytes", "Write to the standard output the number of bytes in each input file.") { options[:bytes] = true }
  opts.on("-l", "--lines", "Write to the standard output the number of lines in each input file.") { options[:lines] = true }
  opts.on("-m", "--chars", "Write to the standard output the number of characters in each input file.") { options[:chars] = true }
  opts.on("-w", "--words", "Write to the standard output the number of words in each input file.") { options[:words] = true }
  opts.on("-h", "--help", "Show this help") { puts opts; exit }
end.parse!
options = {bytes: true, lines: true, chars: false, words: true} if options.empty?

if ARGV.empty?
  text = ARGF.gets_to_end
  print_row(counts(text, options))
else
  rows = ARGV.map do |fd|
           text = File.read(fd)
           row = counts(text, options)
           print_row(row, fd)
           row
         end
  print_row(totals(rows.transpose), "total") if ARGV.size >= 2
end
