
# Quality control using deepTools :

plotFingerprint -b CTL_MORC2_sorted.bam FA_MORC2_sorted.bam --labels CTL_MORC2 FA_MORC2 --minMappingQuality 30 --skipZeros --plotFile fingerprints.png -p max/2

bamPEFragmentSize -b CTL_MORC2_sorted.bam FA_MORC2_sorted.bam -o hist.png -T "Fragment size of PE RNA-seq data" --maxFragmentLength 1000 --samplesLabel  CTL_MORC2 FA_MORC2

plotCoverage -b CTL_MORC2_sorted.bam FA_MORC2_sorted.bam -l CTL_MORC2 FA_MORC2 --plotFile example_coverage -n 1000000 --plotTitle "example_coverage" --ignoreDuplicates --minMappingQuality 10 -o coverage.png -p max/2


multiBamSummary bins --bamfiles CTL_MORC2_sorted.bam FA_MORC2_sorted.bam --minMappingQuality 30 --l  CTL_MORC2 CTL_MPP8 CTL_TASOR FA_MORC2 FA_MPP8 FA_TASOR -o results_HcvsDM.npz -p max/2

# plotcorrelation htmp :

plotCorrelation -in results_HcvsDM.npz -c spearman  --skipZeros --plotTitle "Spearman Correlation of Read Counts" --whatToPlot heatmap --colorMap RdYlBu --plotNumbers  -o heatmap_SpearmanCorr_readCounts.png --outFileCorMatrix SpearmanCorr_readCounts.tab
 
plotCorrelation -in results_HcvsDM.npz -c pearson  --skipZeros --plotTitle "Pearson Correlation of Read Counts" --whatToPlot heatmap --colorMap RdYlBu --plotNumbers  -o heatmap_PearsonCorr_readCounts.png --outFileCorMatrix PearsonCorr_readCounts.tab --removeOutliers

# plotPCA :

plotPCA -in results_HcvsDM.npz -o pca_readcounts.png -T "PCA of read counts"  



