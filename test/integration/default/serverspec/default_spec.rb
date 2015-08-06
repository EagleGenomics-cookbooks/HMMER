require 'serverspec'
require_relative './spec_helper'

# Required by serverspec
set :backend, :exec

describe file("#{ENV['HMMER_DIR']}") do
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
  describe command("which #{file_executable}") do
    its(:exit_status) { should eq 0 }
  end

  describe command("#{file_executable} -h") do
    its(:stdout) { should contain(ENV['HMMER_VERSION']) }
  end
end

%w(
  hmmc2
).each do |file_executable|
  describe command("which #{file_executable}") do
    its(:exit_status) { should eq 0 }
  end
end
