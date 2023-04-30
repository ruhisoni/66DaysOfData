dna = input("Enter DNA sequence of interest: ")
dna=dna.lower()

def GC(dna):
    number_g=dna.count("g")
    number_c=dna.count("c")
    number_n=dna.count("n")
    gc=(number_g+number_c)*100/(len(dna)-number_n)
    return gc

print("The GC content is", GC(dna), "%")
