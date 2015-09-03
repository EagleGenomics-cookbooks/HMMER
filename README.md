# HMMER

Description
===========
This Cookbook to installs HMMER.

http://hmmer.janelia.org/

HMMER is biosequence analysis using profile hidden Markov models. HMMER is used for searching sequence databases for homologs of 
protein sequences, and for making protein sequence alignments. It implements methods using probabilistic models called profile 
hidden Markov models (profile HMMs). Compared to BLAST, FASTA, and other sequence alignment and database search tools based 
on older scoring methodology, HMMER aims to be significantly more accurate and more able to detect remote homologs because 
of the strength of its underlying mathematical models. In the past, this strength came at significant computational expense, 
but in the new HMMER3 project, HMMER is now essentially as fast as BLAST.

Requirements
============

## Platform:

* Centos 6.6

Notes
=====

Usage
=====
Simply include the recipe wherever you would like it installed, such as a run list (recipe[HMMER]) or a cookbook (include_recipe 'HMMER')


## Testing
To test the recipe we use chef test kitchen:

kitchen converge default-centos65 

kitchen login default-centos65

kitchen verify default-centos65

kitchen destroy default-centos65

Attributes
==========
See attributes/default.rb for default values.

default['HMMER']['version'] 

License and Authors
===================

* Authors:: Bart Ailey (<chef@eaglegenomics.com>)
* Authors:: Dan Barrella(<chef@eaglegenomics.com>)
* Authors:: Nick James (<chef@eaglegenomics.com>)

Copyright:: 2015, Eagle Genomics Ltd
    
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
    
ToDo
====
