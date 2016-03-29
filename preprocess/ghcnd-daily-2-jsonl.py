#! /home/cloudera/Python-3.4.4/bin/python3

import os
import os.path as op
import sys
import collections
import json


stnfile = '/home/cloudera/Dump/climate-2015-12-15/ghcnd-stations.txt'
inpath = '/home/cloudera/Dump/climate-2015-12-15/ghcnd_all/'
outfile = './ghcnd-daily.jsonl'

##################################################################################################

def read_station(line):
    datum = collections.OrderedDict()

    data = line.strip()

    sid       = data[0:11].strip()
    latitude  = data[12:20].strip()
    longitude = data[21:30].strip()
    elevation = data[31:37].strip()
    name      = data[41:71].strip()

    datum['id']        = sid
    datum['latitude']  = float(latitude)
    datum['longitude'] = float(longitude)

    if(elevation == '-999.9'):
        datum['elevation'] = None
    else:
        datum['elevation'] = float(elevation)
        
    datum['name'] = str(name)

    return datum

def read_stations(stnfile):
    stations = {}
    for line in open(stnfile):
        station = read_station(line)
        sid = station['id']
        stations[sid] = station

    return stations

##################################################################################################

def read_dlyfiles(inpath, stations, outfile):

    dlyfiles = [ op.join(inpath, f) for f in os.listdir(inpath) if op.isfile(op.join(inpath, f)) ]
    totalfiles = len(dlyfiles)

    with open(outfile, 'w') as outstream:
        for nr, dlyfile in enumerate(dlyfiles):
            try:
                fileobjt = open(dlyfile)
                filesize = op.getsize(dlyfile)
                print("Processing {0} of size {1:9d} bytes. File {2}/{3} Outputsize {4:15,.15g} bytes... ".format(dlyfile, filesize, nr, totalfiles, outstream.tell()))
                
                for line in fileobjt:
                    data = line.strip()
                    
                    sid = data[0:11].strip()
                    if sid in stations:
                        station = stations[sid] 
                        name      = station['name']
                        latitude  = station['latitude']
                        longitude = station['longitude']
                        elevation = station['elevation']
                        
                        otype = str(data[17:21].strip())
                        if otype in ("TAVG",):
                            
                            year = int(data[11:15].strip())
                            month = int(data[15:17].strip())
                            
                            for day in range(1, 32):
                                length = 8
                                index = ((day - 1) * length) + 21
                                
                                field = data[ index : (index + length) ]
                                
                                vtext = field[0:5]
                                
                                if not vtext == '-9999':
                                    value = (float(vtext.strip()) / 10.0)
                                    mflag = field[5]
                                    qflag = field[6]
                                    sflag = field[7]

                                    datum = collections.OrderedDict()
                                    
                                    datum['id'] = sid
                                    #datum['name'] = name
                                    #datum['latitude'] = latitude
                                    #datum['longitude'] = longitude
                                    #datum['elevation'] = elevation
                                    #datum["type"] = otype
                                    datum['year'] = year
                                    datum['month'] = month
                                    datum['day'] = day
                                    datum['value'] = value
                                    
                                    json.dump(datum, outstream)
                                    outstream.write('\n')
                    else:
                        print("ERROR")

                fileobjt.close()
            except OSError:
                print("OS error: {0}".format(err))
            except:
                print("Unexpected error:", sys.exc_info()[0])
                raise

##################################################################################################

stations = read_stations(stnfile)
read_dlyfiles(inpath, stations, outfile)
