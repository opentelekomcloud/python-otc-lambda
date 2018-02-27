source /opt/client/bigdata_env
set spark.sql.tungsten.enabled=false
FILES="../../data/webinar_streaming.sql"
FILES=`realpath "${FILES}"`
TOPIC="test"
BROKERLIST="192.168.0.122:21005"
EXECFILE="../../src/lambda_speedlayer.py"
EXECFILE=`realpath "${EXECFILE}"`
THIRDPARTYDIR=`realpath "../../3p/"`

spark-submit   --jars "$THIRDPARTYDIR/spark-streaming-kafka-assembly_2.10-1.5.1.jar,/opt/client/Spark/spark/lib/streamingClient/kafka-clients-0.8.2.1.jar,/opt/client/Spark/spark/lib/streamingClient/spark-streaming-kafka_2.10-1.5.1.jar,/opt/client/Spark/spark/lib/spark-examples/spark-examples_2.10-1.5.1.jar" --files $FILES $EXECFILE $BROKERLIST $TOPIC