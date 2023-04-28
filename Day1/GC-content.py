dna = input("Enter DNA sequence of interest: ")
smalldna=dna.lower()

def GC(smalldna):
    number_g=smalldna.count("c")
    number_c=smalldna.count("g")
    number_n=smalldna.count("n")
    gc=(number_g+number_c)*100/(len(dna)-number_n)
    return gc

print("The GC content is", GC(smalldna), "%")
