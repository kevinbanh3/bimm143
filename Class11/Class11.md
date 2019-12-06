Class 11: Structural Bioinformatics
================
Kevin Banh
11/5/2019

## The PDB database for biomolecular structure data

Q1: Download a CSV file from the PDB site (accessible from “Analyze” -\>
“PDB Statistics” \> “by Experimental Method and Molecular Type”. Move
this CSV file into your RStudio project and determine the percentage of
structures solved by X-Ray and Electron Microscopy. Also can you
determine what proportion of structures are protein?

Download CSV

``` r
data <- read.csv("Data Export Summary.csv")
data
```

    ##   Experimental.Method Proteins Nucleic.Acids Protein.NA.Complex Other
    ## 1               X-Ray   131278          2059               6759     8
    ## 2                 NMR    11235          1303                261     8
    ## 3 Electron Microscopy     2899            32                999     0
    ## 4               Other      280             4                  6    13
    ## 5        Multi Method      144             5                  2     1
    ##    Total
    ## 1 140104
    ## 2  12807
    ## 3   3930
    ## 4    303
    ## 5    152

``` r
(data$Total)
```

    ## [1] 140104  12807   3930    303    152

``` r
sum(data$Total)
```

    ## [1] 157296

``` r
sum(data$Proteins)
```

    ## [1] 145836

``` r
round(sum(data$Proteins)/sum(data$Total) * 100,2)
```

    ## [1] 92.71

``` r
(data$Total/sum(data$Total)) * 100
```

    ## [1] 89.0702879  8.1419744  2.4984742  0.1926305  0.0966331

Q2:3039

``` r
library(bio3d)
```

``` r
pdb <- read.pdb("1hsg.pdb")
pdb
```

    ## 
    ##  Call:  read.pdb(file = "1hsg.pdb")
    ## 
    ##    Total Models#: 1
    ##      Total Atoms#: 1686,  XYZs#: 5058  Chains#: 2  (values: A B)
    ## 
    ##      Protein Atoms#: 1514  (residues/Calpha atoms#: 198)
    ##      Nucleic acid Atoms#: 0  (residues/phosphate atoms#: 0)
    ## 
    ##      Non-protein/nucleic Atoms#: 172  (residues: 128)
    ##      Non-protein/nucleic resid values: [ HOH (127), MK1 (1) ]
    ## 
    ##    Protein sequence:
    ##       PQITLWQRPLVTIKIGGQLKEALLDTGADDTVLEEMSLPGRWKPKMIGGIGGFIKVRQYD
    ##       QILIEICGHKAIGTVLVGPTPVNIIGRNLLTQIGCTLNFPQITLWQRPLVTIKIGGQLKE
    ##       ALLDTGADDTVLEEMSLPGRWKPKMIGGIGGFIKVRQYDQILIEICGHKAIGTVLVGPTP
    ##       VNIIGRNLLTQIGCTLNF
    ## 
    ## + attr: atom, xyz, seqres, helix, sheet,
    ##         calpha, remark, call

``` r
a.inds <- atom.select(pdb, chain = "A")
a.inds
```

    ## 
    ##  Call:  atom.select.pdb(pdb = pdb, chain = "A")
    ## 
    ##    Atom Indices#: 801  ($atom)
    ##    XYZ  Indices#: 2403  ($xyz)
    ## 
    ## + attr: atom, xyz, call

``` r
ligand <- atom.select(pdb, "protein", value = TRUE)
write.pdb(ligand, file = "1hsg_ligand.pdb")
```
