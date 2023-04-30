import collections

dna = input("Enter DNA sequence of interest: ")
dna=dna.upper()

#ensuring the sequence only contains DNA nucleotides
def ValidateSeq(dna):
    bases = ["A", "C", "T", "G"]
    valid = True
    for nuc in dna:
        if nuc not in bases:
            valid = False; break
    return valid

print("DNA sequence validity:",ValidateSeq(dna))

#method 1 of counting nucleotides in the sequence
def CountNuc1(dna):
    basecount = {"A":0, "C":0, "T":0, "G":0}
    for base in dna:
        basecount[base] += 1
    return basecount

print("Count of nucleotides in DNA sequence:",CountNuc1(dna))

#method 2 of counting nucleotides in the sequence
def CountNuc2(dna):
    return dict(collections.Counter(dna))

print("Count of nucleotides in DNA sequence:",CountNuc2(dna))

def GC(dna):
    number_g=dna.count("G")
    number_c=dna.count("C")
    gc=(number_g+number_c)*100/(len(dna))
    rounded_gc=round(gc,2)
    return rounded_gc

print("GC content in DNA sequence:", GC(dna),"%")

def Transcription(dna):
    comp_bases = {"A":"U", "T":"A", "G":"C", "C":"G"}
    comp_list=[comp_bases[base] for base in dna]
    comp_string=''.join(comp_list)
    reverse_comp=comp_string[::-1]
    return reverse_comp

print("Transcribed RNA:",Transcription(dna))
