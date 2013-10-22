hadoop-cubieboard-cluster
=========================

Configuration, data and code for my Apache Hadoop distributed cluster of Cubieboards

What is Hadoop?
- distributed processing of data across a cluster

It has two components:
MapReduce: a programming model that breaks down problems into discrete units that can be processed in parallel.
HDFS: a distributed file system that replicates data across a cluster for reliability and availability.

All about failure:
- Partial failure support: failure of a component should result in graceful degregation.
- Data recoverability: If a node fails workload should be assumed to the surviving nodes.
- Component recoverability: If a node returns it should be able to rejoin the cluster.
- Consistency: component failures should not affect the outcome of the job.
- Scalability: adding load should result in graceful decline of performance.

3 phases to MapReduce: Map, Shuffle-sort, Reduce
Map: operates on one portion of the data set.
  For example, count the number of times a word appears in a document 
Shuffle-sort:
Reduce: Consolidates the data generated by the map tasks.
  For example, sum the number of times the word appears in the document.
  
"Hello World" of Hadoop
=======================
Map input: "the cat sat on the hat"
Map output:
the: [1]
cat: [1]
sat: [1]
on:  [1] 
the: [1]
hat: [1]
Output of shuffle-sort (becomes input to the Reducer):
cat: [1]
hat: [1]
on:  [1]
sat: [1]
the: [1,1]
Reducer outputs:
cat: 1
hat: 1
on:  1
sat: 1
the: 2

- Each map tasks works on a small portion of the data (typically a single block)
- "Bring the CPU to the data, not the other way around"
- Shared-nothing architecture (nodes don't communicate)

A master program called the Job Tracker allocates work to nodes (slaves running thier own Task Tracker)
that work on blocks stored locally on that node.
Many Nodes working together on thier own part of the data set.

NameNode: manages the HDFS
Secondary NameNode: performs housekeeping for NameNode
Job Tracker: Allocates work to nodes (slaves) across the cluster
DataNode: manages the data on a slave node
Task Tracker: manages the job executing on it's slave node.

What if there is a problem with the slave nodes? Hadoop has a feature called "speculative execution" that can 
replicate to other slave nodes.  Whatever node finishes first notifies the Task Tracker, and kills the other task.

Hadoop is good at things relational databases are bad at (good for single lookup, bad for table scan)
Volume, Velocity, Variety of data.  
Batch Processing

Applications are written at a high level, shielding the developer from the complexity of the infrastructure.






