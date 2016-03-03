#!/home/cloudera/Python-3.3.3/bin/python3

import sys
import collections
import json

infile = './ghcnd-stations.txt'
outfile = './ghcnd-stations.jsonl'

with open(outfile, 'w') as output:
    for line in open(infile):
        data = line.strip()

        datum = collections.OrderedDict()
        
        datum['id']        = str(data[0:11].strip())
        datum['latitude']  = float(data[12:20].strip())
        datum['longitude'] = float(data[21:30].strip())

        elevation = data[31:37].strip()
        '''
        if(elevation == '-999.9'):
            None
        else:
            datum['elevation'] = float(elevation)
        '''
        datum['elevation'] = float(elevation)
        datum['name']      = str(data[41:71].strip())

        output.write("%s\n" % json.dumps(datum))

