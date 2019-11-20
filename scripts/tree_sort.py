import argparse    # 1. argparseをインポート

parser = argparse.ArgumentParser(description='系統樹と表の並び替え')    # 2. パーサを作る

# 3. parser.add_argumentで受け取る引数を追加していく
parser.add_argument('-n', '--newick', help='newick file') 
parser.add_argument('-t', '--table', help='table file, sep = tab, first line index')
parser.add_argument('-o1', '--outgroup1', help='set outgroup1')   
parser.add_argument('-o2', '--outgroup2', help='set outgroup2')  

args = parser.parse_args()    # 4. 引数を解析

print('arg1='+args.arg1)
print('arg2='+args.arg2)
print('arg3='+args.arg3)
print('arg4='+args.arg4)



from ete3 import Tree, TreeStyle
import pandas as pd

NEWICK = args.arg1
g_genome = args.arg2
OUTG1 = args.arg3
OUTG2 = args.arg4


# 系統樹の読み込み

t = Tree(NEWICK , format= 0)
ancestor = t.get_common_ancestor(OUTG1,OUTG2)
t.set_outgroup( ancestor )

ts = TreeStyle()
ts.show_leaf_name = True
ts.show_branch_support = True
t.render(NEWICK+".png", w=600, units="mm",tree_style=ts)
t.write(format=0, outfile=NEWICK+".newick")

print(t)

# ゲノム情報の読み込み
info = pd.read_table(g_genome, sep='\t', index_col=0)
frame = pd.DataFrame(info)

print(frame.info())

# テーブルの並び替え
strain_list = t.get_leaf_names()

print(strain_list)
print(len(strain_list))

SORT = frame.reindex(strain_list)

SORT.to_csv(g_genome+'.sort.txt', sep='\t')

print("OUTPUT FILES:")
print(NEWICK+".newick")
print(NEWICK+".png")
print(g_genome+'.sort.txt')

print('#######')
print(t)
print('#######')
print(SORT)
