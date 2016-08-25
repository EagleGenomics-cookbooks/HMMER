#################################################
# http://eddylab.org/software/hmmer3/3.1b2/hmmer-3.1b2-linux-intel-x86_64.tar.gz
default['HMMER']['version'] = '3.1b2'
default['HMMER']['filename'] = 'hmmer-' + default['HMMER']['version'] + '-linux-intel-x86_64.tar.gz'
default['HMMER']['url'] = 'http://eddylab.org/software/hmmer3/' + default['HMMER']['version'] + '/' + default['HMMER']['filename']
default['HMMER']['install_dir'] = '/usr/local/'
default['HMMER']['dir'] = default['HMMER']['install_dir'] + 'hmmer-' + default['HMMER']['version'] + '-linux-intel-x86_64'

default['apt']['compile_time_update'] = true
