#print(f"{'Left Aligned Text' : <20}") 

# with open('command-line-reference.mdx','r') as f:
#     for line in f:
#         if 'qb' in line:
#             #print(line.strip())
#             a,b = line.split(':')
#             a = a.replace('-','')
#             #print(a)
#             #print (f'[{a.strip()}](advanced-users-guide/command-line-reference/{a.strip()}){b.strip()}\n')
#             c = f'[{a.strip()}](advanced-users-guide/command-line-reference/{a.strip()})'
#             print(f'-\t{c}:{b.strip(): >80}')

with open('command-line-reference.mdx','r') as f:
    for line in f:
        if 'qb' in line:
            #print(line.strip())
            try:
                a,b = line.split(':')
            except ValueError:
                break
            a = a.replace('-','')
            #print(a)
            #print (f'[{a.strip()}](advanced-users-guide/command-line-reference/{a.strip()}){b.strip()}\n')
            c = f'[{a.strip()}](advanced-users-guide/command-line-reference/{a.strip()})'
            print(f'| {c} | {b.strip()} |')
