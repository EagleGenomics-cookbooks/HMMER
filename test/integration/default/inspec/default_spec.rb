describe file('/usr/local/hmmer-3.1b2-linux-intel-x86_64/') do
  it { should be_directory }
end

%w(
  alimask
  esl-afetch
  esl-alimanip
  esl-alimap
  esl-alimask
  esl-alimerge
  esl-alipid
  esl-alistat
  esl-cluster
  esl-compalign
  esl-compstruct
  esl-construct
  esl-histplot
  esl-mask
  esl-reformat
  esl-selectn
  esl-seqrange
  esl-seqstat
  esl-sfetch
  esl-shuffle
  esl-ssdraw
  esl-stranslate
  esl-weight
  hmmalign
  hmmbuild
  hmmconvert
  hmmemit
  hmmerfm-exactmatch
  hmmfetch
  hmmlogo
  hmmpgmd
  hmmpress
  hmmscan
  hmmsearch
  hmmsim
  hmmstat
  jackhmmer
  makehmmerdb
  nhmmer
  nhmmscan
  phmmer
).each do |file_executable|
  describe file("/usr/local/hmmer-3.1b2-linux-intel-x86_64/binaries/#{file_executable}") do
    it { should be_file }
    it { should be_executable }
  end

  describe file("/usr/local/bin/#{file_executable}") do
    it { should be_symlink }
  end
  
  describe command("/usr/local/bin/#{file_executable} -h") do
    its('stdout') { should match /3.1b2/ }
  end
end
