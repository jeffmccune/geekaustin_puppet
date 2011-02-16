Facter.add("datacenter") do
     setcode do
         %x{/bin/echo "Austin"}.chomp
     end
end
