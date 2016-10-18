# Nextflow demo scripts

A set of scripts for Nextflow demo purpose. 


## Prerequisite

* Java 7 or 8 
* Docker engine 1.10.x (or higher) 

## Installation 

Install Nextflow by using the following command: 

```
curl -fsSL get.nextflow.io | bash
```
    
Then copy the script `nextflow` in a directory on your `PATH`. 

   
Finally, clone this repository with the following command: 

```
git clone https://github.com/nextflow-io/demo.git nextflow-demo && cd nextflow-demo 
```    
    
   
## Run the scripts 


The first example run a very simple two-steps pipeline which execute a protein sequence 
alignment and the create a phylogenetic tree. To run this example enter the following 
command in your shell terminal: 

```
nextflow run demo.nf 
```
    
The tree output file is written in the `results` directory. 

By default the script uses the sequences FASTA file named `data/BB11001.tfa`. To use 
a different input specify the `--seq` command line option as shown below: 

```      
nextflow run demo.nf --seq data/BB11029.tfa
```	
	
Check the output in the `results `folder as before. 

In order to run the same script against multiple input sequences specify the input by 
using the common Linux wildcards. For example: 

```
nextflow run demo.nf --seq 'data/BB11*' 
```
	
Note: make sure to wrap the input parameter in quote characters as shown above, to 
avoid that BASH expand the star wildcard to the actual file names. 

The following example shows how to execute multiple alignments and create a single 
phylogenetic tree from all of them. 

```
nextflow run demo2.nf --seq 'data/BB11*' 
```	
	