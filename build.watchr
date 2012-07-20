watch('./Makefile')                     { |md| system "make build"               ; puts "\n"      }
watch('test/.*')                        { |md| system "make test"                ; puts "\n"      }
watch('./jquery\.external_links\.js')   { |md| system "make build_js"            ; puts "\n"      }