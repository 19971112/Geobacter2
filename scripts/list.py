import sys
import glob
from Bio import SeqIO
from Bio.SeqUtils import GC


filename = sys.argv[1]

files = glob.glob(filename)

CONTIG = 0
CDS = 0

print("File Name","Strain Name","Genome Size","Number of Contigs","Number of CDS","GC-content",sep='\t')

for gbff in files:
    lists = []
    for record in SeqIO.parse(gbff, 'genbank'):
        NAME = record.description[:record.description.find(",")]
        lists.append(str(record.seq))
        CONTIG = CONTIG + 1
        for feature in record.features:
            if feature.type == 'CDS':
                CDS = CDS + 1
    seq = "".join(lists)
    SIZE = len(seq)
    GCCON = GC(seq)
    print(gbff,NAME,str(SIZE),str(CONTIG),str(CDS),str(GCCON),sep='\t')
    seq = 0
    CONTIG = 0
    CDS = 0
    
for gbff in files: 
  lists = [] 
  for record in SeqIO.parse(gbff, 'genbank'): 
    print(record.id,gbff,record.description,sep="\t")  
