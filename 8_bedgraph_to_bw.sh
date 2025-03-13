

wget http://hgdownload.soe.ucsc.edu/goldenPath/hg38/bigZips/hg38.chrom.sizes -O hg38.chrom.sizes
sed 's/^\([0-9XYM]\)/chr\1/' hg38.chrom.sizes > hg38_with_chr.chrom.sizes


# CTL_MORC2

sed 's/^\([0-9XYM]\)/chr\1/' CTL_MORC2_spikein.bedgraph > CTL_MORC2_spikein_with_chr.bedgraph

awk 'BEGIN {while(getline < "hg38.chrom.sizes") sizes[$1]=1} $1 in sizes' CTL_MORC2_spikein_with_chr.bedgraph > CTL_MORC2_spikein_filtered.bedgraph

bedGraphToBigWig CTL_MORC2_spikein_filtered.bedgraph hg38.chrom.sizes CTL_MORC2_spikein.bedgraph.bw

# FA_MORC2

sed 's/^\([0-9XYM]\)/chr\1/' FA_MORC2_spikein.bedgraph > FA_MORC2_spikein_with_chr.bedgraph

awk 'BEGIN {while(getline < "hg38.chrom.sizes") sizes[$1]=1} $1 in sizes' FA_MORC2_spikein_with_chr.bedgraph > FA_MORC2_spikein_filtered.bedgraph

bedGraphToBigWig FA_MORC2_spikein_filtered.bedgraph hg38.chrom.sizes FA_MORC2_spikein.bedgraph.bw



