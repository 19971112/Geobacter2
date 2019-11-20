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
