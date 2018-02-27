#!/usr/bin/env python

#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

import threading, logging, time

from kafka import KafkaConsumer, KafkaProducer
import logging
logging.basicConfig(level=logging.DEBUG)
import random
import json
characters = ["chewbacca","Jabba Desilijic Tiure","Leia Organa","Yoda","C-3PO","Obi-Wan Kenobi","Luke Skywalker","C-3PO","R2-D2" ]
tresholds = {
    "healt-blood-pulse":
        {
            "value": 80,
            "ent":20
        },
    "healt-blood-alcohol":
        {
            "value": 0.001,
            "ent":0.00009
        },
    "healt-blood-sugar":
        {
            "value": 4.8,
            "ent":4
        },
    "action-credit-limit":
        {
            "value": 200,
            "ent":200
        }
}

def generate_random_data():
    randomcharacterkey = random.sample(characters,1)[0]
    for randommetrickey in tresholds.keys():
        #randommetrickey = random.sample(tresholds.keys(),1)[0]
		metrics = tresholds[randommetrickey]
		randommetricval = random.random()* metrics["ent"]*2  - metrics["ent"]
		randommetricval = metrics["value"] + randommetricval
		data = str({ "name": randomcharacterkey, "metrics" : randommetrickey, "value": str(randommetricval) })
                data = data.replace("'", '"')
                yield data
    #return ret


class Producer(threading.Thread):
    daemon = True

    def run(self):
        producer = KafkaProducer(bootstrap_servers='192.168.0.122:21005') #9092

        while True:
            for data in generate_random_data():
                print json.dumps( data)
                print data
                producer.send('test', data ) #json.dumps( data ))
                time.sleep(1)


# class Consumer(threading.Thread):
    # daemon = True

    # def run(self):
        # consumer = KafkaConsumer(bootstrap_servers='192.168.0.122:21005')

        # consumer.subscribe(['test'])

        # for message in consumer:
            # print (message)


def main():
    threads = [
        Producer()
#       , Consumer()
    ]

    for t in threads:
        t.start()

    time.sleep(100)

if __name__ == "__main__":
    logging.basicConfig(
        format='%(asctime)s.%(msecs)s:%(name)s:%(thread)d:%(levelname)s:%(process)d:%(message)s',
        level=logging.INFO
        )
    main()

