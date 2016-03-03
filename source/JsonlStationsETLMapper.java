import java.lang.InterruptedException;

import java.io.IOException;

import org.apache.hadoop.mapreduce.Mapper;

import org.apache.hadoop.io.Text;
import org.apache.hadoop.io.LongWritable;

import org.apache.hadoop.conf.Configuration;

import org.apache.avro.Schema;
import org.apache.avro.generic.GenericDatumReader;
import org.apache.avro.generic.GenericRecord;
import org.apache.avro.io.DatumReader;
import org.apache.avro.io.Decoder;
import org.apache.avro.io.DecoderFactory;

import parquet.Log;

public class JsonlStationsETLMapper extends Mapper<LongWritable, Text, Void, GenericRecord>{
    private Schema stationSchema = null;

    @Override
    public void setup(Context context) {
	Configuration conf = context.getConfiguration();
	this.stationSchema = new Schema.Parser().parse(conf.get("climate.stations.schema"));
	System.out.println("START");
    }

    @Override
    public void map(LongWritable key, Text value, Context context) throws IOException, InterruptedException {
	DatumReader<GenericRecord> reader = new GenericDatumReader<GenericRecord>(this.stationSchema);
	Decoder decoder = DecoderFactory.get().jsonDecoder(this.stationSchema, value.toString());
	
	GenericRecord record = reader.read(null, decoder);
	// Dispatch data
	context.write(null, record);
    }

    @Override
    public void cleanup(Context context) {
    }    
}
