rcleaner
========

clean your directories

I wanted to learn how to write a simple ruby DSL.

No executable yet, but the idea is you could install the gem, create an rfile:

```ruby
clean "~/Downloads" do
  copy "*.pdf", to: "pdf/"
  move "*.xls", to: "spreadsheets/"
  move "*.docx", to: "tps-reports/"
  delete "*"
end
```

Then have an executable that would read the DSL and perform the actions.

Haven't quite figured out how I want the CLI to work or the file 
structure where the DSLs should live, but the code is otherwise
complete and working.
