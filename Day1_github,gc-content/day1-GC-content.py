dna = input("Enter DNA sequence of interest: ")
dna=dna.upper()

def GC(dna):
    number_g=dna.count("G")
    number_c=dna.count("C")
    number_n=dna.count("N")
    gc=(number_g+number_c)*100/(len(dna)-number_n)
    return gc

print("The GC content is", GC(dna), "%")
