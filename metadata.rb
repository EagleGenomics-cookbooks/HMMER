name 'HMMER'
maintainer 'Eagle Genomics'
maintainer_email 'chef@eaglegenomics.com'
license 'Apache v2.0'
description 'Installs/Configures HMMER'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '1.0.2'

source_url 'https://github.com/EagleGenomics-cookbooks/HMMER'
issues_url 'https://github.com/EagleGenomics-cookbooks/HMMER/issues'

depends 'build-essential'
depends 'magic_shell'
depends 'apt'
