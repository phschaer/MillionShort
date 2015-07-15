def file = new File("qrels-unclean.csv")

def keys = []

file.splitEachLine("\t"){line ->
	keys.add(line[0] + line[2])
}

keys = keys.unique()

//println keys

def qrelsMap = [:]
def lastIdurl
int lastRel = 0
int counter = 1

file.splitEachLine("\t"){line ->
	def idurl = line[0] + line[2]
	int rel = new Integer(line[3])

	if (idurl.equals(lastIdurl)){
		counter++
		lastRel += rel
	}
	else {		
		double tmp_val = lastRel.div(counter)
		qrelsMap[lastIdurl] = Math.round(Double.parseDouble(tmp_val.toString()))
		qrelsMap[idurl] = Math.round(Double.parseDouble(rel.toString()))
		/**if(idurl.startsWith("4946")) {
			println "tmp_val: $tmp_val"
			println "lastIdurl: $lastIdurl"
			println "lastRel $lastRel"
			println "counter $counter"
			println "${qrelsMap[idurl]}"
			println "......"
		}**/
		lastRel = rel
		counter = 1				
	}

	lastIdurl = idurl	
}

def out = new File("qrels-clean.csv")
out.delete()
def lastkey
file.splitEachLine("\t"){line ->
	def key = line[0] + line[2]
	
	if (key != lastkey && qrelsMap.containsKey(key)){
		out << "${line[0]}\t0\t${line[2]}\t${qrelsMap[key]}\n"
	}
	
	lastkey = key
	
}

//println qrelsMap

