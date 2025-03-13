
### Greenlist : 

cd /path/to/directory

multiBamSummary BED-file --BED hg38_CUTnRUN_greenlist.v1.bed --smartLabels -e --centerReads -o glist_quant.npz  -b CTL_MORC2_sorted.bam FA_MORC2_sorted.bam --outRawCounts output
cat output | tr -d "'#" | sed $'s/\t/_/1' | cut -f 1,3- > glist_quant.tsv
echo "Counts were calculated!!"

Rscript --vanilla get_sizeFactors.R glist_quant.tsv glist_sizeFactors.tsv

bedtools genomecov -bg -ibam "FA_MORC2_sorted.bam" -scale 0.57530468187491 > "FA_MORC2_spikein.bedgraph"

bedtools genomecov -bg -ibam "CTL_MORC2_sorted.bam" -scale 0.997392899005634 > "CTL_MORC2_spikein.bedgraph"


# Then SEACR peaks finding : https://seacr.fredhutch.org/
