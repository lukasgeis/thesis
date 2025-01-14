import sys
import argparse
import urllib.request

# Fields taken from `https://www.bibtex.com/e/entry-types/` with some personal changes
fields = {
    "article": ["author", "title", "journal", "year", "volume", "number", "pages", "doi"],
    "book": ["author", "title", "publisher", "year", "series", "volume", "doi"],
    "booklet": ["title", "author", "howpublished", "month", "year", "doi"],
    "inbook": ["author", "title", "booktitle", "year", "publisher", "pages", "doi"],
    "incollection": ["author", "title", "booktitle", "editor", "publisher", "pages", "doi"],
    "inproceedings": ["author", "title", "booktitle", "series", "year", "pages", "publisher", "doi"],
    "manual": ["title", "author", "organization", "year", "doi"],
    "mastersthesis": ["author", "title", "school", "year", "month", "doi"],
    "misc": ["title", "author", "howpublished", "year", "note", "eprint", "archivePrefix", "doi"],
    "phdthesis": ["author", "title", "school", "year", "month", "doi"],
    "proceedings": ["editor", "title", "series", "volume", "publisher", "year", "doi"],
    "techreport": ["title", "author", "institution", "number", "year", "month", "doi"],
    "unpublished": ["author", "title", "year"]
}


parser = argparse.ArgumentParser()
parser.add_argument("input", type=str)
parser.add_argument("output", type=str)
parser.add_argument("-e", "--encoding", type=str, default="utf-8")
parser.add_argument("--dblp", type=bool, action=argparse.BooleanOptionalAction)

args = parser.parse_args()


with open(args.input, "r", encoding=args.encoding) as infile:
    data = infile.readlines()


fields_removed = 0
dblp_fetched = 0
num_entries = 0

depth = 0
gdepth = 0
entry_type = ""
name = ""
curr_field_name = ""
current_fields = {}
with open(args.output, "w", encoding=args.encoding) as outfile:
    outfile.write("% Encoding: " + args.encoding + "\n")

    for i in range(len(data)):
        if depth == 0:
            if data[i].startswith("@"):
                bracket = data[i].index("{")
                
                entry_type = data[i][1:bracket].lower()
                if entry_type not in fields:
                    print(f"Illegal EntryType in line {i}: {entry_type}")
                    sys.exit(1)
                
                name = data[i][(bracket + 1):(data[i].index(","))]
                if name.startswith("DBLP:") and args.dblp:
                    dblp_name = name[5:]
                    url = f"https://dblp.uni-trier.de/rec/{dblp_name}.bib?param=0"

                    with urllib.request.urlopen(url) as response:
                        dblp_entry = response.read().decode("utf-8")
                        dblp_entry = dblp_entry.replace(r" - Leibniz-Zentrum f{\"{u}}r Informatik", "")
                        dblp_entry = dblp_entry.replace(r"Lecture Notes in Computer Science", r"{LNCS}")
                        dblp_entry = dblp_entry.replace(r"I/O", r"{I/O}")

                        outfile.write(f"\n{dblp_entry}")
                        dblp_fetched += 1
                        continue 
                
                depth = 1 
        else:
            line = data[i].lstrip()

            if line.startswith("}") and depth == 1:
                depth = 0

                outfile.write("\n")
                outfile.write(f"@{entry_type}{{{name},\n")
                for fname, fentries in current_fields.items():
                    outfile.write(f"\t{fname} = {fentries}")
                outfile.write("}\n")
                num_entries += 1
                current_fields = {}
                continue

            if depth == 1:
                sep = line.index("=")
                curr_field_name = line[:sep].rstrip()
                entry = line[(sep + 1):].lstrip()

                depth += entry.count("{") - entry.count("}")

                gnums = ((entry.count('"') - entry.count('\\"') ) % 2)
                if gnums != 0:
                    if gdepth == 0:
                        depth += 1
                        gdepth = 1
                    else:
                        depth -= 1
                        gdepth = 0

                if curr_field_name in fields[entry_type]:
                    current_fields[curr_field_name] = entry
                else:
                    fields_removed += 1
            else:
                if curr_field_name in fields[entry_type]:
                    current_fields[curr_field_name] += line

                depth += line.count("{") - line.count("}")

                gnums = ((line.count('"') - line.count('\\"') ) % 2)
                if gnums != 0:
                    if gdepth == 0:
                        depth += 1
                        gdepth = 1
                    else:
                        depth -= 1
                        gdepth = 0


print(f"Successfully compacted bibliography by {fields_removed} fields among {num_entries} entries.")
if args.dblp:
    print(f"Fetched {dblp_fetched} DBLP entries.")
