
# Gem::Specification for Searchgasm-1.0.2
# Originally generated by Echoe

--- !ruby/object:Gem::Specification 
name: searchgasm
version: !ruby/object:Gem::Version 
  version: 1.0.2
platform: ruby
authors: 
- Ben Johnson of Binary Logic
autorequire: 
bindir: bin

date: 2008-09-12 00:00:00 -04:00
default_executable: 
dependencies: 
- !ruby/object:Gem::Dependency 
  name: activerecord
  type: :runtime
  version_requirement: 
  version_requirements: !ruby/object:Gem::Requirement 
    requirements: 
    - - ">="
      - !ruby/object:Gem::Version 
        version: "0"
    version: 
- !ruby/object:Gem::Dependency 
  name: activesupport
  type: :runtime
  version_requirement: 
  version_requirements: !ruby/object:Gem::Requirement 
    requirements: 
    - - ">="
      - !ruby/object:Gem::Version 
        version: "0"
    version: 
- !ruby/object:Gem::Dependency 
  name: echoe
  type: :development
  version_requirement: 
  version_requirements: !ruby/object:Gem::Requirement 
    requirements: 
    - - ">="
      - !ruby/object:Gem::Version 
        version: "0"
    version: 
description: Makes ActiveRecord searching easier, robust, and powerful. Automatic conditions, pagination support, object based searching, and more.
email: bjohnson@binarylogic.com
executables: []

extensions: []

extra_rdoc_files: 
- CHANGELOG.rdoc
- lib/searchgasm/active_record/associations.rb
- lib/searchgasm/active_record/base.rb
- lib/searchgasm/active_record.rb
- lib/searchgasm/condition/base.rb
- lib/searchgasm/condition/begins_with.rb
- lib/searchgasm/condition/child_of.rb
- lib/searchgasm/condition/contains.rb
- lib/searchgasm/condition/descendant_of.rb
- lib/searchgasm/condition/does_not_equal.rb
- lib/searchgasm/condition/ends_with.rb
- lib/searchgasm/condition/equals.rb
- lib/searchgasm/condition/greater_than.rb
- lib/searchgasm/condition/greater_than_or_equal_to.rb
- lib/searchgasm/condition/inclusive_descendant_of.rb
- lib/searchgasm/condition/keywords.rb
- lib/searchgasm/condition/less_than.rb
- lib/searchgasm/condition/less_than_or_equal_to.rb
- lib/searchgasm/condition/sibling_of.rb
- lib/searchgasm/condition/tree.rb
- lib/searchgasm/conditions/base.rb
- lib/searchgasm/conditions/protection.rb
- lib/searchgasm/config.rb
- lib/searchgasm/core_ext/hash.rb
- lib/searchgasm/helpers/control_types/link.rb
- lib/searchgasm/helpers/control_types/links.rb
- lib/searchgasm/helpers/control_types/remote_link.rb
- lib/searchgasm/helpers/control_types/remote_links.rb
- lib/searchgasm/helpers/control_types/remote_select.rb
- lib/searchgasm/helpers/control_types/select.rb
- lib/searchgasm/helpers/control_types.rb
- lib/searchgasm/helpers/form.rb
- lib/searchgasm/helpers/utilities.rb
- lib/searchgasm/helpers.rb
- lib/searchgasm/search/base.rb
- lib/searchgasm/search/conditions.rb
- lib/searchgasm/search/ordering.rb
- lib/searchgasm/search/pagination.rb
- lib/searchgasm/search/protection.rb
- lib/searchgasm/utilities.rb
- lib/searchgasm/version.rb
- lib/searchgasm.rb
- README.rdoc
files: 
- benchmarks/benchmark.rb
- benchmarks/benchmark_helper.rb
- benchmarks/profile.rb
- CHANGELOG.rdoc
- examples/README.rdoc
- init.rb
- lib/searchgasm/active_record/associations.rb
- lib/searchgasm/active_record/base.rb
- lib/searchgasm/active_record.rb
- lib/searchgasm/condition/base.rb
- lib/searchgasm/condition/begins_with.rb
- lib/searchgasm/condition/child_of.rb
- lib/searchgasm/condition/contains.rb
- lib/searchgasm/condition/descendant_of.rb
- lib/searchgasm/condition/does_not_equal.rb
- lib/searchgasm/condition/ends_with.rb
- lib/searchgasm/condition/equals.rb
- lib/searchgasm/condition/greater_than.rb
- lib/searchgasm/condition/greater_than_or_equal_to.rb
- lib/searchgasm/condition/inclusive_descendant_of.rb
- lib/searchgasm/condition/keywords.rb
- lib/searchgasm/condition/less_than.rb
- lib/searchgasm/condition/less_than_or_equal_to.rb
- lib/searchgasm/condition/sibling_of.rb
- lib/searchgasm/condition/tree.rb
- lib/searchgasm/conditions/base.rb
- lib/searchgasm/conditions/protection.rb
- lib/searchgasm/config.rb
- lib/searchgasm/core_ext/hash.rb
- lib/searchgasm/helpers/control_types/link.rb
- lib/searchgasm/helpers/control_types/links.rb
- lib/searchgasm/helpers/control_types/remote_link.rb
- lib/searchgasm/helpers/control_types/remote_links.rb
- lib/searchgasm/helpers/control_types/remote_select.rb
- lib/searchgasm/helpers/control_types/select.rb
- lib/searchgasm/helpers/control_types.rb
- lib/searchgasm/helpers/form.rb
- lib/searchgasm/helpers/utilities.rb
- lib/searchgasm/helpers.rb
- lib/searchgasm/search/base.rb
- lib/searchgasm/search/conditions.rb
- lib/searchgasm/search/ordering.rb
- lib/searchgasm/search/pagination.rb
- lib/searchgasm/search/protection.rb
- lib/searchgasm/utilities.rb
- lib/searchgasm/version.rb
- lib/searchgasm.rb
- Manifest
- MIT-LICENSE
- Rakefile
- README.rdoc
- test/fixtures/accounts.yml
- test/fixtures/orders.yml
- test/fixtures/users.yml
- test/libs/acts_as_tree.rb
- test/libs/rexml_fix.rb
- test/test_active_record_associations.rb
- test/test_active_record_base.rb
- test/test_condition_base.rb
- test/test_condition_types.rb
- test/test_conditions_base.rb
- test/test_conditions_protection.rb
- test/test_config.rb
- test/test_helper.rb
- test/test_search_base.rb
- test/test_search_conditions.rb
- test/test_search_ordering.rb
- test/test_search_pagination.rb
- test/test_search_protection.rb
- test/text_config.rb
- searchgasm.gemspec
has_rdoc: true
homepage: http://github.com/binarylogic/searchgasm
post_install_message: 
rdoc_options: 
- --line-numbers
- --inline-source
- --title
- Searchgasm
- --main
- README.rdoc
require_paths: 
- lib
required_ruby_version: !ruby/object:Gem::Requirement 
  requirements: 
  - - ">="
    - !ruby/object:Gem::Version 
      version: "0"
  version: 
required_rubygems_version: !ruby/object:Gem::Requirement 
  requirements: 
  - - "="
    - !ruby/object:Gem::Version 
      version: "1.2"
  version: 
requirements: []

rubyforge_project: searchgasm
rubygems_version: 1.2.0
specification_version: 2
summary: Orgasmic ActiveRecord searching
test_files: 
- test/test_active_record_associations.rb
- test/test_active_record_base.rb
- test/test_condition_base.rb
- test/test_condition_types.rb
- test/test_conditions_base.rb
- test/test_conditions_protection.rb
- test/test_config.rb
- test/test_helper.rb
- test/test_search_base.rb
- test/test_search_conditions.rb
- test/test_search_ordering.rb
- test/test_search_pagination.rb
- test/test_search_protection.rb
