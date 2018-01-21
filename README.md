# Introducing the dependency_builder gem

    require 'dependency_builder'

    s = "
    ra0
      sshfs
      apache

    rse
      spspublog
      reg
      apache
      sps

    elis
      ra0

    reg
      sshfs
    "

    dbuild = DependencyBuilder.new(s)
    puts dbuild.to_s

In the above example the input string contained  a listing of nested dependencies for each service. The dependency_builder gem groups the services around each dependency as show in the output below.


Output:

<pre>
sshfs
  ra0
    elis
  reg
    rse
apache
  ra0
  rse
spspublog
  rse
sps
  rse
</pre>

## Resources

* dependency_builder https://rubygems.org/gems/dependency_builder

dependency_builder dependency builder linetree gem
